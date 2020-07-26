Rails.application.routes.draw do
  root "home#index"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  get "auth/:provider/callback", to: "sessions#fb_google_create"
  
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

  resources :buyers do
    member do
      get "sell"
      post "sell"
    end  
    collection do
      get "bought"
      post "bought"
      get "sold"
      post "sold"
    end
  end 
  resources :messages, only: [:new, :create]
  resources :notifications, only: :index do
    post "read_message", on: :member
  end
  resources :posts do
    member do
      post "approve"
      post "reject"
      get "approve_review"
      post "approve_review"
    end  
  end    
  resources :reviews, only: [:new, :create, :edit, :destroy, :show, :update]
  resources :users do
    collection do
      get "unchecked"
      get "rejected"
    end
  end

  get '*path' => redirect("/404.html")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
