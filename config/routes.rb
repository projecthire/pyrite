Rails.application.routes.draw do

  constraints subdomain: /^admin(\.|$)/ do
    devise_for :admins,
               path_names: { sign_in: 'login', sign_out: 'logout' }

    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end

  resources :contacts, only: [:new, :create]
  devise_for :candidates,
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: {
               registrations: 'candidates/registrations',
               omniauth_callbacks: 'candidates/omniauth_callbacks'
             }

  resources :registration_wizard, path: 'registration'

  authenticated :candidate do
    root 'candidates#dashboard', as: :candidate_dashboard
  end

  unauthenticated :candidate do
    root 'pages#candidate_landing'
  end
end
