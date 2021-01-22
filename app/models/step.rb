class Step < ApplicationRecord
    NESTED_ALLOWED_PARAMS = [:id, :_destroy, :step, :recipe_id]
    belongs_to :recipe
end
