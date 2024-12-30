Rails.application.routes.draw do
  root 'home#index'

  # Direct routes for convenience
  get '/login', to: 'access_control/login#login', as: 'login'
  get '/register', to: 'access_control/register#register', as: 'register'
  post '/login', to: 'access_control/login#create'
  post '/register', to: 'access_control/register#create'
  delete '/logout', to: 'access_control/login#destroy', as: 'logout'

  # Redirect old routes to new ones
  namespace :access_control do
    get '/login', to: redirect('/login')
    get '/register', to: redirect('/register')
  end
end
