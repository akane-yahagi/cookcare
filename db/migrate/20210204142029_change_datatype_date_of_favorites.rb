class ChangeDatatypeDateOfFavorites < ActiveRecord::Migration[5.2]
  def change
    change_column :favorites, :date, :datetime
  end
end
