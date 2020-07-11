Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :posts
  resources :artists
  resources :artists, only: [:show, :new, :create, :index] do
    resources :posts, only: [:show, :index]
  end
  root 'posts#index'
  

  


end
