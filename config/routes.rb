Rails.application.routes.draw do
  # devise_for :users
  # get 'articles/index'
  root to: 'articles#index'

  resources :sample_articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles


  devise_for :users
  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions'
  # }

  # devise_scope :user do
  #   get "user/:id", :to => "users/registrations#detail"
  #   get "signup", :to => "users/registrations#new"
  #   get "login", :to => "users/sessions#new"
  #   get "logout", :to => "users/sessions#destroy"




end
