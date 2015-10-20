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

  namespace :candidates, module: :candidates do
    resources :registration_wizard, path: 'registration'
  end

  get 'candidates/email_valid', to: 'candidates#email_valid'

  get 'how_it_works', to: 'pages#how_it_works', as: 'how_it_works'
  get 'terms', to: 'pages#terms_and_conditions', as: 'terms'
  get 'privacy', to: 'pages#privacy_policy', as: 'privacy'
  get 'faq', to: 'pages#faq', as: 'faq'

  get 'employers', to: 'employers#landing', as: :employers_landing

  authenticated :candidate do
    root 'candidates#dashboard', as: :candidate_dashboard
  end

  root 'candidates#landing'
end
