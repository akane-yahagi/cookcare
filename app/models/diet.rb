class Diet < ApplicationRecord
    
    has_many :favorites
    
    has_many :category_diets
    has_many :categories, through: :category_diets
    
    has_many :recipe_diets
    has_many :recipes, through: :recipe_diets
    
    has_many :user_diets
    has_many :users, through: :user_diets
end
