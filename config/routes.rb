Rails.application.routes.draw do
  root "home#index"

  delete "/logout", to: "sessions#destroy"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"

  resources :posts
  resources :users

    get "/unchecked",  to: "users#unchecked"
    get "/rejected",  to: "users#rejected"

  namespace :admin do
    resources :categories

    get "/pending",  to: "ads#pending"
    post "/approved", to: "ads#approve"
    post "/rejected", to: "ads#reject"

    get "/approved",  to: "ads#approved"
    

    get "/rejected",  to: "ads#rejected"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
