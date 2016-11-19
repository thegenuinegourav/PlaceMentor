Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'
  post '/home', to: 'pages#create'
  get '/logout', to: 'pages#destroy'
  
  resources :companies do
    member do
      post 'like'
    end
  end
  
  resources :users, except: [:new,:index]
  get '/register', to: 'users#new'
  
  
end
