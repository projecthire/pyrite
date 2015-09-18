Rails.application.routes.draw do
  root "contacts#new"

  devise_for :users, path_prefix: 'auth', path_names: { sign_in: "login", sign_out: "logout" },
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resource :contacts
end
