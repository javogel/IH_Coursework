Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  post '/reviews', to: 'reviews#create'
  delete '/reviews', to: 'reviews#destroy', :as => :review_delete
  get '/reviews', to: 'reviews#update_form', :as => :review_update
  patch '/reviews', to: 'reviews#update', :as => :review
  post '/login_validation', to: 'users#login_validation'
  post '/products/:product_id/bid', to: 'bids#create', as: :product_bids
  get '/dashboard', to: 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
