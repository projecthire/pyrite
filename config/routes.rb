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

  get 'candidates/email_valid', to: 'candidates#email_valid'

  resources :registration_wizard, path: 'registration'

  get 'terms' => 'high_voltage/pages#show', id: 'terms_and_conditions'
  get 'privacy' => 'high_voltage/pages#show', id: 'privacy_policy'

  authenticated :candidate do
    root 'candidates#dashboard', as: :candidate_dashboard
  end

  unauthenticated :candidate do
    root 'pages#candidate_landing'
  end

  get 'how_it_works', to: 'pages#how_it_works', as: 'how_it_works'
  get 'faq', to: 'pages#faq', as: 'faq'

end
