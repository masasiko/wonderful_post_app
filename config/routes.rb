Rails.application.routes.draw do

  get '/mypage' => 'mypage#index'

  devise_for :users

  root to: 'articles#index'

  resources :articles




  resources :users



end
