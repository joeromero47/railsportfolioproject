Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' =>  'sessions#fbcreate'

  
  resources :ratings
  resources :games
  
  resources :ratings do
    resources :games, only: [:new, :create, :index, :show]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
