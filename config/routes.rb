Rails.application.routes.draw do
  resources :posts
    resources :comments, only: [:create, :destroy]
  
  root to: 'posts#index'
  
  devise_for :users

end
