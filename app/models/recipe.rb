class Recipe < ApplicationRecord
    
    validates :title, presence: true, length: {maximum: 20}
    validates :step, presence: true
    
    belongs_to :user
    has_many :ingredients
    #accepts_nested_attributes_for :recipe_ingredients
    has_many :recipe_ingredients
    has_many :categories
    has_many :recipe_categories, through: :recipes, source: 'category'
end
