Rails.application.routes.draw do
  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check
  get 'profile', to: 'profile#profile'

  resources :profiles, only: [:index, :show, :create]
end
