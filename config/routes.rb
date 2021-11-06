Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update] 
  
  
  resources :books do
  resources :post_comments
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resource :favorites , only: [:create , :destroy]
  
  end
  get 'home/about' => 'homes#about'
  
  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  
end