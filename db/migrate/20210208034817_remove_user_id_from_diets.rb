class RemoveUserIdFromDiets < ActiveRecord::Migration[5.2]
  def change
    remove_column :diets, :user_id, :integer
  end
end
