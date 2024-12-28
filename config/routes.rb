Rails.application.routes.draw do
  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check
  get 'profiles', to: 'profiles#profile'  # Update here

  resources :profiles, only: [:index, :show, :create]
end
