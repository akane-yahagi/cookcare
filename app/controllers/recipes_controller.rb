class RecipesController < ApplicationController
  
  autocomplete :ingredient, :name, full: true
  
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new
    @categories = Category.all
    @recipe.steps.build
    @recipe.ingredients.build
    @quantity = @recipe.recipe_ingredients.build
    # カテゴリーの取得とingredientsの取得　.all
  end
  
  def create
    @recipe = current_user.recipes.new(recipe_params)
    
    if @recipe.save
      redirect_to recipes_path, seccess: "投稿完了"
    else
      flash[:danger] = "投稿失敗"
      render :new
    end
  end
  
  def show
    @recipe = Recipe.find_by(id: params[:id])
    @step = @recipe.steps
    @category = @recipe.categories
    @ingredient = @recipe.ingredients
    @quantity = @recipe.recipe_ingredients
  end
  
  def destroy
    @recipe = current.recipe
    @recipe.destroy
    redirect_to recipe_path, danger: "作成中のレシピを削除しました"
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(Recipe::ALLOWED_PARAMS, steps_attributes: Step::NESTED_ALLOWED_PARAMS, recipe_ingredients_attiributes: [:quantity], ingredients_attributes: [:name], recipe_categories_attributes: [:category_id])
  end
end
