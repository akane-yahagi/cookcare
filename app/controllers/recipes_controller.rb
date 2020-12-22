class RecipesController < ApplicationController
  def index
  end
  
  def new
    @recipe = Recipe.new
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
    params.require(:recipe).permit(:title, :recipe_image, :step)
  end
end
