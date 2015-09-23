Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  devise_for :candidates,
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: { registrations: 'candidates/registrations' }

  root "contacts#new"
end
