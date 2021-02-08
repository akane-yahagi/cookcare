class DietsController < ApplicationController
  def index
    @diets = Diet.all
  end
  
  def new
    @diet = Diet.new
  end
end
