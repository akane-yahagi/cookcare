class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :memo
      t.datetime :start_time
      
      t.timestamps
    end
  end
end
