class AddDetailsToDiets < ActiveRecord::Migration[5.2]
  def change
    add_column :diets, :user_id, :integer
    add_column :diets, :recipe_id, :integer
    add_column :diets, :title, :string
  end
end
