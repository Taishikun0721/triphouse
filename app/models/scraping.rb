require 'mechanize'

class Scraping
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
      @area = area
      links.each do |link|
        get_information(link)
      end
    end
  end

  def self.get_information(a)
    agent = Mechanize.new
    page = agent.get(a)
    name = page.at(".post-title").inner_text
    image_url = page.at("img").get_attribute("src")
    picture_area = @area
    place = Place.where(name: name).first_or_initialize
    place.name = name
    place.image_url = image_url
    place.area = picture_area
    place.save
  end
end
