class DietsController < ApplicationController
	
	before_action :authenticate_user
	
	def index
		@diets = Diet.where(user_id: current_user).order(start_time: "desc")
		@diet = Diet.new
		@memos = current_user.memos
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
	
	def edit
		@diet = Diet.find_by(id: params[:id])
	end
	
	def update
		@diet = Diet.find(params[:id])
		
		if @diet.update(diet_params)
			redirect_to diets_path
		else
			render :edit
		end
	end
	
	def destroy
		@diet = Diet.find_by(id: params[:id])
		@diet.destroy
		redirect_to diets_path, danger: "記録を削除しました"
	end
	
	private
	def diet_params
		params.require(:diet).permit(:recipe_id, :title, :place, :start_time, category_ids: [], category_diets_attributes: [:category_id]).merge(user_id: current_user.id)
	end
end
