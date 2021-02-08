class DietsController < ApplicationController
  def index
    @diets = Diet.all
    # @diets = Diet.where(user_id: current_user)
  end
  
  def new
    @diet = Diet.new
  end
end
