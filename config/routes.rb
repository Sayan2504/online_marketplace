Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  root "home#index"

  #for authentication
  delete "/logout", to: "sessions#destroy"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"


  #fb authentication
  resources :socials
  get "auth/:provider/callback", to: "sessions#fb_google_create"

  

  #for reviews
  resources :reviews
  get "/approve_review", to: "posts#approve_review"
  post "/approve_review", to: "posts#approve_review"
  

  resources :users

  #for posts
  resources :posts
  get "/unchecked",  to: "users#unchecked"
  get "/rejected",  to: "users#rejected"
  get "/approve", to: "posts#approve"
  post "/approve", to: "posts#approve"
  get "/reject", to: "posts#reject"
  post "/reject", to: "posts#reject"
  
  

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
  post "/read_message", to: "notifications#read_message"
  

  #Admin section
  namespace :admin do
    resources :categories

    get "/approve", to: "ads#approve"
    post "/approve", to: "ads#approve"
    get "/reject", to: "ads#reject"
    post "/reject", to: "ads#reject"
    get "/approved",  to: "ads#approved"
    get "/rejected",  to: "ads#rejected"
    get "/unchecked",  to: "ads#unchecked"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
