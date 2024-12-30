Rails.application.routes.draw do
  root 'home#index'

  # Direct routes for convenience
  get '/login', to: 'access_control/login#login'
  get '/register', to: 'access_control/register#register'
  post '/login', to: 'access_control/login#create'
  post '/register', to: 'access_control/register#create'
  delete '/logout', to: 'access_control/login#destroy'

  namespace :access_control do
    # Redirect GET requests to new routes
    get '/login', to: redirect('/login')
    get '/register', to: redirect('/register')
  end
end
