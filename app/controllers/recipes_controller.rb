class RecipesController < ApplicationController
  def index
  end
  
  def new
    @recipe = Recipe.new
    @step = @recipe.steps.build
    @ingredients = Ingredient.all
    @recipe.recipe_ingredients.build
    @categories = Category.all
    # カテゴリーの取得とingredientsの取得　.all
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save
      redirect_to recipes_path, seccess: "投稿完了"
    else
      flash[:danger] = "投稿失敗"
      render :new
    end
  end
  
  def destroy
    @recipe = current.recipe
    @recipe.destroy
    redirect_to recipe_path, danger: "作成中のレシピを削除しました"
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :recipe_image, steps_attirbutes: [:id, :step, :recipe_id, :_destroy], recipe_ingredients_attirbutes: [:quantity], ingredients_attributes: [:name], categories_attiributes: [:name])
  end
end
