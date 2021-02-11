class Diet < ApplicationRecord
    
    has_many :category_diets
    has_many :categories, through: :category_diets
    accepts_nested_attributes_for :category_diets, allow_destroy: true
    has_many :records, :as => :recordable
end
