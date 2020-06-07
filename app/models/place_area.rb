class PlaceArea < ApplicationRecord
  has_many :places

  def self.create_data
    place_areas = ["アジア","アフリカ","オセアニア","ヨーロッパ","中央アメリカ","中東","北アメリカ","南アメリカ"]
    place_areas.each do |area|
      PlaceArea.create( area_name: area)
    end
  end
  # Place_areaテーブルのデータを作成する

end
