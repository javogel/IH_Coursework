Rails.application.routes.draw do
  resources :users
  root to: 'contacts#index'
  get 'contacts', to: 'contacts#index'
  get 'contacts/index', to: 'contacts#index', as: 'home'
  get 'contacts/new', to: 'contacts#new', as: 'new'
  post 'contacts/new', to: 'contacts#create'
  get 'contacts/show/:id', to: 'contacts#show', as: 'show'
  post 'contacts/show/:id/favorite', to: 'contacts#favorite'
  get 'contacts/allfavorites', to: 'contacts#allfavorites', as: 'favorites'
  get '/search', to: 'contacts#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
