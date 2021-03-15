class User < ApplicationRecord
    
    #emailが~@~.~の正規表示
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    #passwordが半角英数字最低1文字以上、かつ、8文字以上12文字以下の正規表示
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,12}+\z/i
    
    has_secure_password
    validates :name, presence: true, length: {maximum: 15}
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
    validates :password, presence: true, format: {with: VALID_PASSWORD_REGEX}
    
    has_many :recipes
    
    has_many :favorites
    has_many :favorite_recipes, through: :favorites, source: 'recipe'
    
    has_many :memos
    has_many :memo_recipes, through: :memos, source: 'recipe'
    
end
