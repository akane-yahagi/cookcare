class RecipesController < ApplicationController
  def index
  end
  
  def new
    @recipe = Recipe.new
    10.times { @recipe.ingredients.build }
    10.times { @recipe.recipe_ingredients.build }
    1.times { @recipe.categories.build }
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
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :recipe_image, :step, recipe_ingredients_attirbutes: [:quantity], ingredients_attributes: [:name], categories_attiributes: [:name])
  end
end
