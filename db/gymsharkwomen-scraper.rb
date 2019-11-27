require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'json'
require 'byebug'
class GymSharkWomenScraper
  def self.scrape
    products = []
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    limit = 1 # page limit in url
    for page_number in 1..limit
      url = URI("https://eu.gymshark.com/collections/all-products/womens?page=#{page_number}")
      # Search each link inside a card
      agent.get(url).search(".grid__item .prod-image-wrap a").each do |link|
        ######TODO 1: will click the link and scrape data inside that link
          agent_inside = Mechanize.new
          agent_inside.user_agent_alias = 'Mac Safari'
          inside_page_link = "https://eu.gymshark.com#{link[:href]}"
          ## We enter the page for each link and save the data we want
          current_agent = agent_inside.get(inside_page_link)
          product = {
            name: get_place_name(current_agent),
            price: get_price_range(current_agent),
            image: get_image(current_agent)
          }
          products << product
      end
    end
    save(products)
    products
  end

  private


  def self.get_price_range(agent)
    cost_element = agent.search('.pinfo__price__total').text
    cost = cost_element.match(/\d+/)
    cost && cost[0] != '' ? cost[0].to_f / 2 : 0
  end
  def self.get_place_name(agent)
    return agent.search(".pinfo__heading").text
  end

  def self.get_image(agent)
    image_array = []
    agent.search(".pimages .pimages__image").each do |url|
      image_array << url.values[2]
    end
    return image_array
  end

  def self.save(data)
    File.open('gymsharkwomen.json', "w+") do |f|
      f << data.to_json
    end
  end
end
