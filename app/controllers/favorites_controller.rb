class FavoritesController < ApplicationController

	before_action :authenticate_user
	before_action :set_recipe
	
	def create
		if @recipe.user_id != current_user.id
			@favorite = @recipe.favorites.new(user_id: current_user.id)
		# binding.pry
			if @favorite.save
				redirect_to recipe_url(@recipe), success: "お気に入りに登録"
			else
				redirect_to recipe_url(@recipe), danger: "お気に入りに登録に失敗しました"
			end
		end
	end
	
	def destroy
		@favorite = Favorite.find_by(user_id: current_user.id)
		@favorite.destroy
		redirect_to recipe_url(@recipe), success: "お気に入りから解除"
	end
	
	
	# def index
	# 	@favorite_recipes = current_user.favorite_recipes.select(:id, :user_id,:title, :recipe_image, :status).distinct
	# 	@f_recipes = current_user.favorites.favorite.order(created_at: :desc)
	# end
	
	# def cooked
	# 	@favorite_recipes = current_user.favorite_recipes.select(:id, :user_id,:title, :recipe_image, :status).distinct
	# 	@f_recipes = current_user.favorites.cooked
	# end
	
	
	private
	
	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end
	
	def favorite_params
		params.required(:favorite).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
	end

end
