Rails.application.routes.draw do
  get 'home/index', to: 'jobs#home', as: :jobs_search
  devise_for :users, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out', sign_up: 'sign_up' }
  root 'home#index'
end
