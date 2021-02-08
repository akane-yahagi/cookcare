class DietsController < ApplicationController
  def index
    @diet = Diet.new
    @categories = Category.all
    @diets = Diet.all
    
  end
end
