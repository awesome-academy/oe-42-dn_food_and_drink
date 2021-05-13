Rails.application.routes.draw do
  root "home#index"
  get "/search", to: "home#search"
  get "/detail", to: "home#detail"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "carts/:id", to: "carts#show", as: "cart"
  delete "carts/:id", to: "carts#destroy"

  post "detail_orders/:id/update", to: "detail_orders#update_quantity", as: "detail_order_update"
  post "detail_orders", to: "detail_orders#create"
  get "detail_orders/:id", to: "detail_orders#show", as: "detail_order"
  delete "detail_orders/:id", to: "detail_orders#destroy"

  resources :users, only: %i{new create}
  resources :categories, only: %i{new create}
  resources :items, only: %i{new create}
end
