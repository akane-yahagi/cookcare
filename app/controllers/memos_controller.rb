class MemosController < ApplicationController
	before_action :set_recipe, only: [:create]
	
	def index
	end
	
	def create
		@memo = @recipe.memos.new(memo_params)
		if @memo.save
			redirect_to recipe_url(@recipe), success: "カレンダーに記録しました"
		else
			redirect_to recipe_url(@recipe), danger: "カレンダーの記録に失敗しました"
		end
	end
	
	private
	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end
	
	def memo_params
		params.required(:memo).permit(:memo, :start_time).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
	end


end