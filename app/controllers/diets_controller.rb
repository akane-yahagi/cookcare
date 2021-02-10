class DietsController < ApplicationController
	def index
		@diets = Diet.where(user_id: current_user).order(start_time: "desc")
		@diet = Diet.new
		# binding.pry
	end
	
	def create
		@diet = Diet.new(diet_params)
		# binding.pry
		if @diet.save
			redirect_to diets_path, seccess: "記録完了"
		else
			flash[:danger] = "記録失敗"
			render :index
		end
	end
	
	private
	def diet_params
		params.require(:diet).permit(:recipe_id, :title, :place, :start_time, category_ids: [], category_diets_attributes: [:category_id]).merge(user_id: current_user.id)
	end
end
