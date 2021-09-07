Rails.application.routes.draw do


  resources :stories
  devise_for :accounts
  
  post '/accounts/:id/follow', to: "accounts#follow", as: "follow_account"
  post '/accounts/:id/unfollow', to: "accounts#unfollow", as: "unfollow_account"
 
  

  
  get "/profile/:id",to:"accounts#profile", as:"profile"
  get "/search/:id",to: "accounts#search",as:"search"
  
  resources :accountposts do
    resources :comments
    member do
      put '/like', to: 'accountposts#upvote'
      put '/unlike', to: 'accountposts#downvote'
    end
  end
  root to: "public#index"
  
end