class Recipe < ApplicationRecord
    
    mount_uploader :recipe_image, RecipeImageUploader
    
    ALLOWED_PARAMS = [:title, :user_id, :recipe_image, :status, {category_ids: []}, {ingredient_ids: []}]
   
    validates :title, presence: true, length: {maximum: 20}
    
    enum status: { draft: 0, published: 1 }
    validates :status, inclusion: { in: Recipe.statuses.keys }
    

    belongs_to :user
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
    # accepts_nested_attributes_for :ingredients
    
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories
    accepts_nested_attributes_for :recipe_categories, allow_destroy: true
    # accepts_nested_attributes_for :categories
    
    has_many :steps, dependent: :destroy
    accepts_nested_attributes_for :steps, allow_destroy: true
end
