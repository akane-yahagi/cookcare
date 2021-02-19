class Step < ApplicationRecord
    NESTED_ALLOWED_PARAMS = [:id, :_destroy, :recipe_id, :step]
    
    validates :step, presence: true, length: {maximum: 30}
    belongs_to :recipe
end
