Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#top'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :recipes
  # resources :recipes do
  #   get :autocomplete_ingredient_name, on: :collection
  # end
    
  resources :ingredients do
    get :autocomplete_ingredient_name, on: :collection # 追加
  end
end
