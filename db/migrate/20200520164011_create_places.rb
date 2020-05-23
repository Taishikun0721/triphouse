class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :area
      t.timestamps
    end
  end
end
