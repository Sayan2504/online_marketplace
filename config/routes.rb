Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  root "home#index"

  #fr authentication
  delete "/logout", to: "sessions#destroy"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"


  #fb authentication
  get "auth/:provider/callback", to: "sessions#fb_google_create"

  resources :socials

  #for reviews
  post "rapproved", to: "posts#rapprove" 
  resources :reviews

  resources :users

  #for posts
  resources :posts
  get "/unchecked",  to: "users#unchecked"
  get "/rejected",  to: "users#rejected"
  post "/approved", to: "posts#approve"
  post "/rejected", to: "posts#reject"

  #for buying
  resources :buyers
  post "/sell", to: "buyers#sell"
  get "/sell", to: "buyers#sell"

  post "/bought", to: "buyers#bought"
  get "/bought", to: "buyers#bought"

  post "/sold", to: "buyers#sold"
  get "/sold", to: "buyers#sold"
  
  #for internal communication
  resources :messages #chat
  resources :notifications #bell notification in account

  #Admin section
  namespace :admin do
    resources :categories

    get "/unchecked",  to: "ads#unchecked"
    post "/approved", to: "ads#approve"
    post "/rejected", to: "ads#reject"
    get "/approved",  to: "ads#approved"
    get "/rejected",  to: "ads#rejected"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
