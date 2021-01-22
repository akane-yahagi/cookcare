class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:ingredients, :categories, :steps)
  end
  
  def new
    @recipe = Recipe.new
    @recipe.steps.build
    @ingredients = Ingredient.all
    @recipe.recipe_ingredients.build
    @categories = Category.all
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
  end
  
  def destroy
    @recipe = current.recipe
    @recipe.destroy
    redirect_to recipe_path, danger: "作成中のレシピを削除しました"
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(Recipe::ALLOWED_PARAMS, steps_attributes: Step::NESTED_ALLOWED_PARAMS, recipe_ingredients_attiributes: [:quantity], ingredients_attributes: [:name], categories_attiributes: [:name])
  end
end
