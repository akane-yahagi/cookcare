class IngredientsController < ApplicationController
    def autocomplete_name
    # params[:company]の値でUser.companyを前方一致検索、company列だけ取り出し、nilと空文字を取り除いた配列
        names = Ingredient.by_name_like(autocomplete_params[:name]).pluck(:name).reject(&:blank?)
        render json: names
    end
    
    private
    def autocomplete_params
      params.permit(:name)
    end
end
