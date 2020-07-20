Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/most_posts', to: 'users#most_posts'
  
  
  
  resources :users, only: [:show, :new, :create, :index] do
    resources :posts, only: [:show, :index, :new, :create, :destroy] 
    
  end
  

  resources :posts do
    resources :likes
  end 
  
  resources :artists, only: [:show, :new, :create, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      resources :likes 
      collection do
        get :most_posts
      end 
    end 
  end
  root 'posts#index'
  

  


end