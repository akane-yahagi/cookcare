class AddStatusToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :status, :integer, default: 0, null:false
  end
end
