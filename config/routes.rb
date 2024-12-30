Rails.application.routes.draw do
  root 'home#index'

  # Direct routes for convenience
  get '/login', to: 'access_control/login#login', as: 'login'
  get '/register', to: 'access_control/register#register', as: 'register'
  post '/login', to: 'access_control/login#create'

  # Correctly define the POST /register route within the access_control namespace
  namespace :access_control do
    post '/register', to: 'register#create'
    post '/login', to: 'login#create'
    delete '/logout', to: 'login#destroy', as: 'logout'
  end

  # Redirect old routes to new ones
  namespace :access_control do
    get '/login', to: redirect('/login')
    get '/register', to: redirect('/register')
  end
end
