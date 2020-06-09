class PlaceArea < ApplicationRecord
  has_many :places

  def self.create_data
    place_areas = %W[\u30A2\u30B8\u30A2 \u30A2\u30D5\u30EA\u30AB \u30AA\u30BB\u30A2\u30CB\u30A2 \u30E8\u30FC\u30ED\u30C3\u30D1 \u4E2D\u592E\u30A2\u30E1\u30EA\u30AB \u4E2D\u6771 \u5317\u30A2\u30E1\u30EA\u30AB \u5357\u30A2\u30E1\u30EA\u30AB]
    place_areas.each do |area|
      PlaceArea.create(area_name: area)
    end
  end
  # Place_areaテーブルのデータを作成する
end
