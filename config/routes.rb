Rails.application.routes.draw do
  # get 'users/show'
  root to: 'articles#index'
  resources :users, only: :show
  devise_for :users

  resources :articles
  resources :sample_articles
end
