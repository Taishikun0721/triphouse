class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :review
      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end
  end
end
