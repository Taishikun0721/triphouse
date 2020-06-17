class Place < ActiveRecord::Migration[5.2]
  def change
    add_column  :places, :place_area_id, :integer
  end
end
