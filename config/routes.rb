Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  devise_for :candidates

  root "contacts#new"
end
