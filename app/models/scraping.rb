require 'mechanize'

class Scraping
  def self.page_urls
    agent = Mechanize.new
    links = []
    page = agent.get('https://worldheritagesite.xyz/ranking/ranking-countries/rank-southamerica/')
    elements = page.search(".read_more_par a")
    elements.each do |ele|
      links << ele.get_attribute("href")
    end

    links.each do |link|
      get_information(link)
    end
  end

  def self.get_information(a)
    agent = Mechanize.new
    page = agent.get(a)
    name = page.at(".post-title").inner_text
    image_url = page.at("img").get_attribute("src")
    place = Place.where(name: name).first_or_initialize
    place.name = name
    place.image_url = image_url
    place.save
  end
end
