# Use this file to create your database through the commands rails db:seed
# If you already have a db created please drop it and create a new with this
# seed
ProductStyle.destroy_all
Product.destroy_all
UserProductType.destroy_all
ProductType.destroy_all
UserColour.destroy_all
UserStyle.destroy_all
Colour.destroy_all
Cut.destroy_all
Style.destroy_all
User.destroy_all


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

# dummy image
image_url = "https://img.gymshark.com/image/fetch/q_auto,f_auto,w_900/https://cdn.shopify.com/s/files/1/0098/8822/products/ULTRA_SEAMLESS_SPORTS_BRA_BLACK_A-Edit_61c2aab9-0f87-4efe-9b7b-67f62d50b418.jpg?v=1571438805"

# Products
puts "Creating 10 products"
10.times {
    Product.create!(
    {
      name: Faker::Name.name,
      product_type: ProductType.all.sample,
      colour: Colour.all.sample,
      cut: Cut.all.sample,
      price: rand(10..50),
      image_url: image_url
    }
  )
}

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




