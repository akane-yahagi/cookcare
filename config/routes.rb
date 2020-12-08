Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'home#top'
  
  resources :users
  resources :recipes
end
