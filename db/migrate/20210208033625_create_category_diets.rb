class CreateCategoryDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :category_diets do |t|
      
      t.integer :diet_id
      t.integer :category_id

      t.timestamps
    end
  end
end
