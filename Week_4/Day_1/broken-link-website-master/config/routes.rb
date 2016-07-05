Rails.application.routes.draw do
  get '/' => 'visitors#home', as: :home
  get '/about' => 'visitors#about', as: :about
  get '/blog' => 'visitors#blog'
  get '/contact' => 'visitors#contact'
end
