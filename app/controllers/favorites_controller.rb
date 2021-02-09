class FavoritesController < ApplicationController

	before_action :set_recipe
	
	def index
		@favorite_recipes = current_user.favorite_recipes
	end
	
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@favorite = @recipe.favorites.new(favorite_params)
		@favorite.user_id = current_user.id
		
		binding.pry
		if @favorite.save
			# if @favorite.cooked?
			#   redirect_to recipes_url, success: "Cookedに登録"
			# elsif @favorite.favorite?
			#   redirect_to recipes_url, success: "favoritesに登録しました"
			# else
			#   redirect_to recipes_url, success: "not my favorite"
			# end
			redirect_to recipes_url, success: "登録成功"
		else
			redirect_to recipes_url, danger: "登録に失敗しました"
		end
	end
	
	private
	
	def set_recipe
	@recipe = Recipe.find(params[:recipe_id])
	end
	
	def favorite_params
	params.required(:favorite).permit(:memo, :status, :date)
	end
end
