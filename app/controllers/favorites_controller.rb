class FavoritesController < ApplicationController

	before_action :set_recipe
	
	def index
		@favorite_recipes = current_user.favorite_recipes
	end
	
	def create
		@favorite = @recipe.favorites.new(favorite_params)
		# binding.pry
		if @favorite.save
			if @favorite.cooked?
			  redirect_to recipes_url, success: "Cookedに登録"
			elsif @favorite.favorite?
			  redirect_to recipes_url, success: "favoritesに登録しました"
			else
			  redirect_to recipes_url, success: "not my favorite"
			end
		else
			redirect_to recipes_url, danger: "登録に失敗しました"
		end
	end
	
	private
	
	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end
	
	def favorite_params
		params.required(:favorite).permit(:memo, :status, :start_time).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
	end
end
