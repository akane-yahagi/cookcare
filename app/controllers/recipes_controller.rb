class RecipesController < ApplicationController
	
	before_action :authenticate_user
	
	def index
		@recipes = Recipe.published.order(updated_at: :desc).includes(:user, :favorite_users)
	end
	
	def search
		redirect_to recipes_path if params[:search] == ""
		@array_searches = params[:search].split(/[[:blank:]]+/)
		@recipes = []
		@array_searches.each do |search|  # 分割したキーワードごとに検索
			next if search == "" 
			recipes = Recipe.joins(:ingredients)
			@recipes += recipes.where('ingredients.name LIKE ? ', "%#{search}%").or(recipes.where('title LIKE ?', "%#{search}%"))
			#原則前方一致
		end
		@recipes.uniq!
		# @recipes = Recipe.published.order(created_at: :desc).search(params[:search])
	end
	
	def new
		@recipe = Recipe.new
		@categories = Category.all
		@recipe.steps.build
		@recipe.recipe_ingredients.build
		@recipe.ingredients.build
		# カテゴリーの取得とingredientsの取得　.all
	end
	
	def create
		@recipe = current_user.recipes.new(recipe_params)
		params[:recipe][:recipe_ingredients_attributes].each do |attribute|
			attribute.each_with_index do |ingredient, index|
				next if index == 0
			
				# binding.pry
				@ingredient = Ingredient.find_by(name: ingredient[:ingredient][:name])
				# binding.pry
				if @ingredient.nil?
					@ingredient = Ingredient.new(name: ingredient[:ingredient][:name])
					
					@ingredient.save
				end
				@recipe.recipe_ingredients.build(ingredient: @ingredient, quantity: ingredient[:quantity])
				# @recipe.ingredients << @ingredient
			end
		end
		
		# binding.pry
		# # binding.pry
		# #複数だからidがうまくひきわたせない、update_attributes
		
		if @recipe.save
			redirect_to recipes_path, seccess: "投稿完了"
		else
			flash[:danger] = "投稿失敗"
			render :new
		end
	end
	
	def show
		@recipe = Recipe.find_by(id: params[:id])
		@steps = @recipe.steps
		@categories = Category.all
		@recipe_categories = @recipe.recipe_categories
		@recipe_ingredients = @recipe.recipe_ingredients
		@favorite = Favorite.new
		@favorite_recipe = @recipe.favorites.find_by(user_id: current_user)
	end
	
	def edit
		@recipe = Recipe.find(params[:id])
		@categories = Category.all
		# binding.pry
	end
	
	def update
		@recipe = Recipe.find(params[:id])
		
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end
	
	def from_draft
		@recipes = current_user.recipes.draft.order(created_at: :desc)
	end
	
	def published
		@recipes = current_user.recipes.published.order(created_at: :desc)
	end
	
	def destroy
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.destroy
		redirect_to recipes_path, danger: "レシピを削除しました"
	end
	
	private
	def recipe_params
		params.require(:recipe).permit(Recipe::ALLOWED_PARAMS, steps_attributes: Step::NESTED_ALLOWED_PARAMS, recipe_categories_attributes: [:category_id])
	end
	
	def search_recipe_params
		params.fetch(:q, '').permit(:body)
	end
	
end