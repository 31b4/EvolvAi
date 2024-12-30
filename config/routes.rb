Rails.application.routes.draw do
  root 'home#index'

  # Direct routes for convenience
  get '/login', to: 'access_control/login#login'
  get '/register', to: 'access_control/register#register'
  post '/login', to: 'access_control/login#create'
  post '/register', to: 'access_control/register#create'
  delete '/logout', to: 'access_control/login#destroy'


  # Bad solution, it should just always forard to /login instead of /access_control/login
  namespace :access_control do
    # Redirect old routes to new ones
    get '/login', to: redirect('/login')
    get '/register', to: redirect('/register')
  end
end
