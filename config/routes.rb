Rails.application.routes.draw do

	root 'home#top'
	get 'sessions/new'
	
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	
	get 'favorites/index'
	resources :users
	get 'recipes/from_draft', to: 'recipes#from_draft'
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
	
end
