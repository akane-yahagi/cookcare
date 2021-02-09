class DietsController < ApplicationController
	def index
		@diets = Diet.all
		@diet = Diet.new
		@categories = Category.all
		
	end
end
