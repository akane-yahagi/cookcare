class Recipe < ApplicationRecord
    
    validates :title, presence: true, length: {maximum: 20}
    validates :step, presence: true
    
    belongs_to :user
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    accepts_nested_attributes_for :recipe_ingredients
    # accepts_nested_attributes_for :ingredients
    
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories
    accepts_nested_attributes_for :recipe_categories
    # accepts_nested_attributes_for :categories
    
    has_many :steps
    accepts_nested_attributes_for :steps, allow_destroy: true
end
