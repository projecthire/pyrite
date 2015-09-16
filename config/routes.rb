Rails.application.routes.draw do
  root "contacts#new"

  devise_for :users, path_prefix: 'auth'

  resource :contacts
end
