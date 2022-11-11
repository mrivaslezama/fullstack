Rails.application.routes.draw do
  resources :tweets
  get '/home',        to: 'pages#home'
  get '/contact',     to: 'pages#contact'
  root 'pages#home'

  # Articles
  get 'articles', to: 'articles#index'
  get 'articles/new', to: 'articles#new'
  post 'articles/form', to: 'articles#create'
end
