Rails.application.routes.draw do

	get 'diets/index'
	get 'favorites/index'
	get 'sessions/new'
	root 'home#top'
	
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	
	resources :users
	resources :recipes do
		resources :favorites, only: [:create, :destroy]
		collection do
			get 'search'
		end
	end

	resources :ingredients do
		get :autocomplete_ingredient_name, on: :collection
	end
	
	resources :diets
	
	resources :records
	
end
