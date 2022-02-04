Rails.application.routes.draw do
  # get 'users/show'
   get '/mypage' => 'mypage#index'
  devise_for :users
  resources :users, only: :show
  # resources :mypage, only: :index


  resources :articles
root to: 'articles#index'
end
