class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :user_id
      t.string :title
      t.string :recipe_image
      t.text :step

      t.timestamps
    end
  end
end
