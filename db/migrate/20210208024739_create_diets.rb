class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
       t.integer :favorite_id
       t.datetime :start_time
       
       t.timestamps
    end
  end
end
