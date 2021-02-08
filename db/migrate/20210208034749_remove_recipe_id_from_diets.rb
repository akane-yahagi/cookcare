class RemoveRecipeIdFromDiets < ActiveRecord::Migration[5.2]
  def change
    remove_column :diets, :recipe_id, :integer
  end
end
