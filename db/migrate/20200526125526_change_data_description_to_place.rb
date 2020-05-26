class ChangeDataDescriptionToPlace < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :description, :text
  end
end
