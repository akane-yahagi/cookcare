class RenameDateColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :date, :start_time
  end
end
