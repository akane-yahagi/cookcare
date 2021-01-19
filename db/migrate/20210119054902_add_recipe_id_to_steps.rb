class AddRecipeIdToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :recipe_id, :string
  end
end
