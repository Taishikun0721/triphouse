require 'mechanize'

class Scraping
  def self.delete_data(from, to)
    (from..to).each do |num|
      Place.find(num).destroy
    end
  end
  # 任意のデータを削除する

  def self.update_area
    (1..30).each do |num|
      place = Place.find(num)
      place.update(area: 'アジア')
    end

    (31..60).each do |num|
      place = Place.find(num)
      place.update(area: 'アフリカ')
    end

    (61..90).each do |num|
      place = Place.find(num)
      place.update(area: 'オセアニア')
    end

    (91..119).each do |num|
      place = Place.find(num)
      place.update(area: 'ヨーロッパ')
    end

    (120..149).each do |num|
      place = Place.find(num)
      place.update(area: '中央アメリカ')
    end

    (150..179).each do |num|
      place = Place.find(num)
      place.update(area: '中東')
    end

    (180..209).each do |num|
      place = Place.find(num)
      place.update(area: '北アメリカ')
    end

    (210..238).each do |num|
      place = Place.find(num)
      place.update(area: '南アメリカ')
    end
  end

  # areaの値を格納する

  def self.update_area(from,to)
    for num in from..to do
      place = Place.find(num)
      place.update( area: "")
    end
  end

  def self.page_urls
    agent = Mechanize.new
    links = []
    areas = ['rank-asia/', 'rank-africa/', 'rank-oceania/', 'rank-europe/', 'rank-central-america/', 'rank-middle-east/', 'rank-northamerica/', 'rank-southamerica/']
    areas.each do |area|
      page = agent.get('https://worldheritagesite.xyz/ranking/ranking-countries/' + area)
      elements = page.search('.read_more_par a')
      elements.each do |ele|
        links << ele.get_attribute('href')
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
    name = page.at('.post-title').inner_text
    image_url = page.at('img').get_attribute('src')
    description = page.at('.entry-inner p').inner_text
    picture_area = @area
    place = Place.where(name: name, image_url: image_url, area: picture_area).first_or_initialize
    place.description = description
    place.save
  end
end
# DBへの格納処理
