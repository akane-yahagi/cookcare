class Diet < ApplicationRecord
    
    has_many :favorites
    
    has_many :category_diets
    has_many :categories, through: :category_diets
end
