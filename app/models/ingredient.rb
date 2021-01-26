class Ingredient < ApplicationRecord
    #前方一致検索
    scope :by_name_like, lambda { |name|
        where('name LIKE :value', { value: "#{sanitize_sql_like(name)}%"})
    }
    
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
end
