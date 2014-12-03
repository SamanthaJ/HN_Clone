Rails.application.routes.draw do
  resources :posts do 
    member do 
      put "like", to:'posts#upvote'
      put "dislike", to: 'posts#downvote'
    end
    resources :comments, only: [:create, :destroy]
  end
  
  root to: 'posts#index'
  
  devise_for :users

end
