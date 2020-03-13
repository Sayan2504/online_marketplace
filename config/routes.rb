Rails.application.routes.draw do
  
  delete "/logout", to: "sessions#destroy"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"

  resources :posts


  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
