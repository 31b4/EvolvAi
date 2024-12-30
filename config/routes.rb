Rails.application.routes.draw do
  root 'home#index'

  # AccessControl controller routes
  get '/login', to: 'access_control/login#login', as: 'login'
  post '/login', to: 'access_control/login#create'
  get '/register', to: 'access_control/register#register', as: 'register'
  post '/register', to: 'access_control/register#create'
  delete '/logout', to: 'access_control/login#destroy', as: 'logout'

  # Redirect old routes
  get '/access_control/login', to: redirect('/login')
  get '/access_control/register', to: redirect('/register')
end
