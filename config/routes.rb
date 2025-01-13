Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out', sign_up: 'sign_up' }
  get 'jobs/search', to: 'jobs#search', as: :search_jobs
  root 'home#index'
end
