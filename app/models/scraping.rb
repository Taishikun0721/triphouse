require 'mechanize'

class Scraping

  def self.delete_data(from,to)
    for num in from..to do
      Place.find(num).destroy
    end
  end

  def self.update_area(from,to)
    for num in from..to do
      place = Place.find(num)
      place.update( area: "")
    end
  end

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
