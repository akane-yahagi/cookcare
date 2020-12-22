class Recipe < ApplicationRecord
    
    validates :title, presence: true, length: {maximum: 20}
    validates :step, presence: true
    
    belongs_to :user
end
