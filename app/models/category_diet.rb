class CategoryDiet < ApplicationRecord
    
    belongs_to :diet
    belongs_to :category
end
