Rails.application.routes.draw do
  root "home#index"

  delete "/logout", to: "sessions#destroy"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"

  get "auth/:provider/callback", to: "sessions#fb_create"


  resources :posts
  
  post "rapproved", to: "posts#rapprove" 

  resources :reviews

  resources :users

  get "/unchecked",  to: "users#unchecked"
  get "/rejected",  to: "users#rejected"
  post "/approved", to: "posts#approve"
  post "/rejected", to: "posts#reject"

  





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
