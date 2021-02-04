Rails.application.routes.draw do
  get 'favorites/index'
  get 'sessions/new'
  root 'home#top'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :recipes do
    resources :favorites, only: [:create, :destroy]
  end

  resources :ingredients do
    get :autocomplete_ingredient_name, on: :collection
  end
  
end
