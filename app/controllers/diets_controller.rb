class DietsController < ApplicationController
	def index
		@diets = Diet.all
		@diet = Diet.new
		@categories = Category.all
		@category_diet = @diet.category_diets
	end
	
	def create
		@diet = Diet.new(diet_params)
		
		if @diet.save
			redirect_to diets_path, seccess: "投稿完了"
		else
			flash[:danger] = "投稿失敗"
			render :index
		end
	end
	
	private
	def diet_params
		params.require(:diet).permit(:start_time, category_diets_attributes: [:category_id])
	end
end
