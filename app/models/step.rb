class Step < ApplicationRecord
    NESTED_ALLOWED_PARAMS = [:id, :_destroy, :recipe_id, :step]
    
    belongs_to :recipe
end
