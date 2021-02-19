class Category < ApplicationRecord
    
    has_many :recipe_categories
    has_many :recipes, through: :recipe_categories
    
    has_many :category_diets
    has_many :diets, through: :category_diets
    accepts_nested_attributes_for :category_diets, allow_destroy: true
    
    CSV.foreach('db/category_data.csv') do |row|
        Category.create(:id => row[0], :name => row[1])
    end
end