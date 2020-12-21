Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#top'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :recipes
end
