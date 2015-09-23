Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  devise_for :candidates, controllers: {
    registrations: 'candidates/registrations'
  }

  root "contacts#new"
end
