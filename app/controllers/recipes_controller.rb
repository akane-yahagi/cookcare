class RecipesController < ApplicationController
  
  autocomplete :ingredient, :name, full: true
  
  def index
    @recipes = Recipe.published.order(created_at: :desc).includes(:user)
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
  end
  
  def destroy
    @recipe = current_recipe
    @recipe.destroy
    redirect_to recipe_path, danger: "作成中のレシピを削除しました"
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(Recipe::ALLOWED_PARAMS, steps_attributes: Step::NESTED_ALLOWED_PARAMS, recipe_categories_attributes: [:category_id])
  end
end

# recipe_ingredients_attributes: RecipeIngredient::NESTED_ALLOWED_PARAMS, ingredients_attributes: Ingredient::NESTED_ALLOWED_PARAMS,
