Rails.application.routes.draw do

  # get 'articles/index'


    root :to => 'articles#index'
    resources :sample_articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles

devise_for :users


end
