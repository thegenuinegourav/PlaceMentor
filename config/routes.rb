Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'
  post '/home', to: 'pages#create'
  get '/logout', to: 'pages#destroy'
  
  resources :companies do
    member do
      post 'like'
      get '/likes', to: 'companies#user_likes'
    end
  end
  
  resources :users, except: [:new,:index, :destroy]
  get '/register', to: 'users#new'
  
  resources :branches, only: [:new, :create, :show]
  
  
end
