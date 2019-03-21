Rails.application.routes.draw do
  resources :articles
  root to:'homes#index'
  resources :homes
  resources :users
end
