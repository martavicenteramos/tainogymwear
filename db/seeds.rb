# Use this file to create your database through the commands rails db:seed
# If you already have a db created please drop it and create a new with this
# seed

# Product Types
puts "creating product types"
sports_bra = ProductType.create(name: "sports_bra")
leggings = ProductType.create(name: "leggings")
crop_tops = ProductType.create(name: "crop-tops")
t_shirts = ProductType.create(name: "t-shirts")
shorts = ProductType.create(name: "shorts")
hoodies = ProductType.create(name: "hoodies")

# Colours
puts "creating colours"
black = Colour.create(name: "black")
pastel = Colour.create(name: "pastel")
bright = Colour.create(name: "bright")
neutral = Colour.create(name: "neutral")

# Cuts
puts "creating cuts"
tight = Cut.create(name: "tight")
loose = Cut.create(name: "loose")

# Styles
puts "creating syles"
shoulders = Style.create(name: "shoulders")
belly = Style.create(name: "belly")
arms = Style.create(name: "arms")
waist = Style.create(name: "waist")
legs = Style.create(name: "legs")
glutes = Style.create(name: "glutes")

# dummy image
image_url = "https://img.gymshark.com/image/fetch/q_auto,f_auto,w_900/https://cdn.shopify.com/s/files/1/0098/8822/products/ULTRA_SEAMLESS_SPORTS_BRA_BLACK_A-Edit_61c2aab9-0f87-4efe-9b7b-67f62d50b418.jpg?v=1571438805"

# Products
puts "Creating 10 products"
10.times {
    Product.create!(
    {
      product_type: ProductType.all.sample,
      colour: Colour.all.sample,
      cut: Cut.all.sample,
      price: rand(10..50),
      image_url: image_url
    }
  )
}

# One style per product products
puts "Creating 10 products"
Product.all.each do |ele|
  ProductStyle.create({
    product: ele,
    style: Style.all.sample
  })
end

## Please manually add more styles to a few of your Products
# with the following command
# ProductStyle.create(style_id:#, product_id:#)

