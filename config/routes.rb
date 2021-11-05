Rails.application.routes.draw do
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
  
  

  
end