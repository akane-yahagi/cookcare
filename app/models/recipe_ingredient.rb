class RecipeIngredient < ApplicationRecord
    
    NESTED_ALLOWED_PARAMS = [ :id, :_destroy, :quantity, :recipe_id, :ingredient_id, ingredient_attributes: Ingredient::NESTED_ALLOWED_PARAMS ]
    
    has_many :recipes
    has_many :ingredients
    
end
