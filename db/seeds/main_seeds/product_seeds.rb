# Use this file to create your database through the commands rails db:seed
# If you already have a db created please drop it and create a new with this
# seed
# # require 'mechanize'
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

class DoYouEvenWomenScraper
  def self.scrape
    products = []
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    limit = 1 # page limit in url
    for page_number in 1..limit
      url = URI("https://www.doyoueven.com/collections/women-all?page=#{page_number}")
      # Search each link inside a card
      agent.get(url).search(".productGrid .productItem .details a").each do |link|
        ######TODO 1: will click the link and scrape data inside that link
          agent_inside = Mechanize.new
          agent_inside.user_agent_alias = 'Mac Safari'
          inside_page_link = "https://www.doyoueven.com#{link[:href]}"
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
    cost_element = agent.search('.price').text
    cost = cost_element.match(/\d+/)
    cost && cost[0] != '' ? cost[0].to_f / 2 : 0
  end
  def self.get_place_name(agent)
    return agent.search(".title").text
  end

  def self.get_image(agent)
    image_array = []
    agent.search(".ImagesPart a").each do |url|
      image_array << url[:href].split("//")[1]
    end
    return image_array
  end

  def self.save(data)
    File.open('doyouevenwomen.json', "w+") do |f|
      f << data.to_json
    end
  end
end

puts "cheguei ao 1"
Wishlist.destroy_all
puts "cheguei ao 2"
OrderProduct.destroy_all
puts "cheguei ao 3"
Order.destroy_all
puts "cheguei ao 4"
ProductStyle.destroy_all
puts "cheguei ao 5"
Product.destroy_all
puts "cheguei ao 6"
UserProductType.destroy_all
puts "cheguei ao 7"
ProductType.destroy_all
puts "cheguei ao 8"
UserColour.destroy_all
puts "cheguei ao 9"
UserStyle.destroy_all
puts "cheguei ao 10"
Colour.destroy_all
puts "cheguei ao 11"
Cut.destroy_all
puts "cheguei ao 12"
Style.destroy_all
puts "cheguei ao 13"
User.destroy_all
puts "cheguei ao 14"
Picture.destroy_all
puts "cheguei ao fim"



# Product Types
puts "creating product types"
sports_bra = ProductType.create(name: "Sports Bra")
leggings = ProductType.create(name: "Leggings")
crop_tops = ProductType.create(name: "Crop Top")
t_shirts = ProductType.create(name: "T-shirt")
shorts = ProductType.create(name: "Shorts")
hoodies = ProductType.create(name: "Hoodie")

# Colours
puts "creating colours"
black = Colour.create(name: "Black")
pastel = Colour.create(name: "Pastel")
bright = Colour.create(name: "Bright")
neutral = Colour.create(name: "Neutral")

# Cuts
puts "creating cuts"
tight = Cut.create(name: "Tight")
loose = Cut.create(name: "Loose")

# Styles
puts "creating syles"
shoulders = Style.create(name: "Shoulders")
belly = Style.create(name: "Belly")
arms = Style.create(name: "Arms")
waist = Style.create(name: "Waist")
legs = Style.create(name: "Legs")
glutes = Style.create(name: "Glutes")
cleavage = Style.create(name: "Cleavage")

# Initiate scraper
gym_shark_scraper = GymSharkWomenScraper.scrape
do_you_even_scraper = DoYouEvenWomenScraper.scrape

# dummy image
# img = "https://images.unsplash.com/photo-1562886877-0be0db6aba84?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3289&q=80"


# Products & Picture & Cloudinary
puts "Create GymSharkWomen products"
gym_shark_scraper[0..50].each do |st|
   gss = Product.create!(
    {
      name: st[:name],
      product_type: ProductType.all.sample,
      colour: Colour.all.sample,
      cut: Cut.all.sample,
      price: st[:price]
    })
      st[:image].each do |img|
        begin
        uploaded_from_scrapper = Cloudinary::Uploader.upload(img, options = {})
        Picture.create!(
  {
        remote_url_url: uploaded_from_scrapper["secure_url"],
        product_id: gss.id
  })
          rescue => e
          puts e
      end
  end
  puts gss
end

puts "Create DoYouEvenWomen products"
do_you_even_scraper[0..50].each do |st|
   dyes = Product.create!(
    {
      name: st[:name],
      product_type: ProductType.all.sample,
      colour: Colour.all.sample,
      cut: Cut.all.sample,
      price: st[:price]
    })
    st[:image].each do |img|
      begin
        uploaded_from_scrapper = Cloudinary::Uploader.upload("https://" + img, options = {})
        Picture.create!(
          {
            remote_url_url: uploaded_from_scrapper["secure_url"],
            product_id: dyes.id
          })
      rescue => e
        puts e
      end
    end
    puts dyes
end


#Cloudinary & Picture

# One style per product products
puts "Adding styles to the products"
Product.all.each do |ele|
  ProductStyle.create({
    product: ele,
    style: Style.all.sample
  })
end

# fPlease manually add more styles to a few of your Products
# with the following command
# ProductStyle.create(style_id:#, product_id:#)

puts "Creating users"

puts "Generating Users"
puts "Login user"
puts "Email: test@email.com"
puts "Password 00000000 (8 0s)"

User.create!(
  email: "test@email.com",
  password: '00000000',
  first_name: "Conan",
  last_name:"The Barbarian",
  cut: Cut.all.sample,
  min_price: rand(15..20),
  max_price: rand(20..70)
  )

puts "Generating 5 fake users"
puts "All users with password 123456"

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    cut: Cut.all.sample,
    min_price: rand(15..20),
    max_price: rand(20..70)
  )
end

puts "generating colours for users"

User.all.each do |user|
  # creating user colours
  colour_array = Colour.all.sample(rand(0..3))
  colour_array.each do |colour|
    UserColour.create!({
      colour: colour,
      user: user
    })
  end

  # creating user product types
  product_type_array = ProductType.all.sample(rand(0..6))
  product_type_array.each do |type|
    UserProductType.create!({
      product_type: type,
      user: user
    })
  end

  # create styles
  style_array = Style.all.sample(rand(0..7))
  style_array.each do |style|
    UserStyle.create!({
      style: style,
      user: user
    })
  end
end

5.times do
  Order.create!({
    total_value: 0,
    date: Time.new,
    status: "pending",
    address: Faker::Address.full_address,
    user: User.all.sample
  })
end

Order.all.each do |order|
  5.times do
    OrderProduct.create!({
      product: Product.all.sample,
      quantity: rand(0..50),
      size: ["XS", "S", "M", "L", "XL"],
      order: order
    });
  end
end
