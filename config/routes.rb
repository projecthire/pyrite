Rails.application.routes.draw do
  resources :contacts

  root "contacts#new"
end
