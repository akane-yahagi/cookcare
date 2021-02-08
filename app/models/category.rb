class Category < ApplicationRecord
    
    has_many :recipe_categories
    has_many :recipes, through: :recipe_categories
    
    # CSV.foreach('db/category_data.csv') do |row|
    #     Category.create(:id => row[0], :name => row[1])
    # end
end