class Ingredient < ApplicationRecord
    # #前方一致検索
    # scope :by_name_like, lambda { |name|
    #     where('name LIKE :value', { value: "#{sanitize_sql_like(name)}%"})
    # }
    
    NESTED_ALLOWED_PARAMS = [:id, :_destroy, :name ]
    has_many :recipe_ingredients, dependent: :destroy
    has_many :recipes, through: :recipe_ingredients
    
    ##uniqueエラーでた。最初のみ使える?
    # #csvファイルを扱うためのgemを読み込む
    # CSV.foreach('db/ingredient_data.csv') do |row|
    # #foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
    # #rowには、読み込まれた行が代入される
    #     Ingredient.create(:id => row[0], :name => row[1])
    #     #usersテーブルの各カラムに、各行のn番目の値を代入している。
    # end
end
