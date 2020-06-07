require 'mechanize'

class Scraping

  def self.delete_data(from,to)
    for num in from..to do
      Place.find(num).destroy
    end
  end
  # 任意のデータを削除する

  def self.update_area
    for num in 1..30 do
      place = Place.find(num)
      place.update( area: "アジア")
    end

    for num in 31..60 do
      place = Place.find(num)
      place.update( area: "アフリカ")
    end

    for num in 61..90 do
      place = Place.find(num)
      place.update( area: "オセアニア")
    end

    for num in 91..119 do
      place = Place.find(num)
      place.update( area: "ヨーロッパ")
    end

    for num in 120..149 do
      place = Place.find(num)
      place.update( area: "中央アメリカ")
    end

    for num in 150..179 do
      place = Place.find(num)
      place.update( area: "中東")
    end

    for num in 180..209 do
      place = Place.find(num)
      place.update( area: "北アメリカ")
    end

    for num in 210..238 do
      place = Place.find(num)
      place.update( area: "南アメリカ")
    end
  end

  # areaの値を格納する

  def self.page_urls
    agent = Mechanize.new
    links = []
    areas = ["rank-asia/","rank-africa/","rank-oceania/","rank-europe/","rank-central-america/","rank-middle-east/","rank-northamerica/","rank-southamerica/"]
    areas.each do |area|
      page = agent.get("https://worldheritagesite.xyz/ranking/ranking-countries/" + area)
      elements = page.search(".read_more_par a")
      elements.each do |ele|
        links << ele.get_attribute("href")
      end
      links.each do |link|
        @area = area
        get_information(link)
      end
    end
  end
  # スクレイピングでPlaceテーブルのデータを撮ってくる

  def self.get_information(a)
    agent = Mechanize.new
    page = agent.get(a)
    name = page.at(".post-title").inner_text
    image_url = page.at("img").get_attribute("src")
    description = page.at(".entry-inner p").inner_text
    picture_area = @area
    place = Place.where(name: name, image_url: image_url, area: picture_area).first_or_initialize
    place.description = description
    place.save
  end
end
 # DBへの格納処理
