Rails.application.routes.draw do

  root 'pages#landing'

  resources :contacts, only: [:new, :create]
  devise_for :candidates,
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: { registrations: 'candidates/registrations' }

  constraints subdomain: /^admin(\.|$)/ do
    devise_for :admins,
               path_names: { sign_in: 'login', sign_out: 'logout' }

    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end

end
