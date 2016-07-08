Rails.application.routes.draw do
  resources :products
  resources :users

  root to: 'users#login'
  post '/login_validation', to: 'users#login_validation'
  post '/products/:product_id/bid', to: 'bids#create', as: :product_bids
  get '/dashboard', to: 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
