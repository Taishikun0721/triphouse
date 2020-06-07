class Place < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :place_area

  def self.add_areasnumber(from,to)
    for num in from..to do
      area = Place.find(num)
      if area.area == "アジア"
        area.update( place_area_id: 1 )
      elsif area.area == "アフリカ"
        area.update( place_area_id: 2 )
      elsif area.area == "オセアニア"
        area.update( place_area_id: 3 )
      elsif area.area == "ヨーロッパ"
        area.update( place_area_id: 4 )
      elsif area.area == "中央アメリカ"
        area.update( place_area_id: 5 )
      elsif area.area == "中東"
        area.update( place_area_id: 6 )
      elsif area.area == "北アメリカ"
        area.update( place_area_id: 7 )
      else area.area =="南アメリカ"
        area.update( place_area_id: 8 )
      end
    end
  end
end
