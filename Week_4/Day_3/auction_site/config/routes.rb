Rails.application.routes.draw do
  resources :products
  resources :users

  post '/products/:product_id/bid', to:'bids#create', as: :product_bids
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
