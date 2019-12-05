# List all the colours
p black = Colour.find_by(name: "Black")
p pastel = Colour.find_by(name: "Pastel")
p bright = Colour.find_by(name: "Bright")
p neutral = Colour.find_by(name: "Neutral")

# List all the product_types
p sports_bra = ProductType.find_by(name: "Sports Bra")
p leggings = ProductType.find_by(name: "Leggings")
p crop_top = ProductType.find_by(name: "Crop Top")
p t_shirt = ProductType.find_by(name: "T-shirt")
p shorts = ProductType.find_by(name: "Shorts")
p hoodie = ProductType.find_by(name: "Hoodie")

# List all the cuts
p tight = Cut.find_by(name: "Tight")
p loose = Cut.find_by(name: "Loose")

# List all the styles
p shoulders = Style.find_by(name: "Shoulders")
p belly = Style.find_by(name: "Belly")
p arms = Style.find_by(name: "Arms")
p waist = Style.find_by(name: "Waist")
p legs = Style.find_by(name: "Legs")
p glutes = Style.find_by(name: "Glutes")

## The name of all the products

# "camo seamless long sleeve crop top"
p prod = Product.find_by(name: "camo seamless long sleeve crop top")
p prod.colour = black
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end


ProductStyle.create!(
  product: prod,
  style: belly
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )
p ProductStyle.where(product: prod)



# "vital seamless leggings"
p prod = Product.find_by(name: "vital seamless leggings")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end


ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)


# "energy+ seamless leggings"
p prod = Product.find_by(name: "energy+ seamless leggings")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end


ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# "non stop leggings - grey"
p prod = Product.find_by(name: "non stop leggings - grey")
p prod.colour = neutral
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end


ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# "non stop leggings - black"
p prod = Product.find_by(name: "non stop leggings - black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# laser cut sports bra
p prod = Product.find_by(name: "laser cut sports bra")
p prod.colour = black
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: belly
  )

ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)


# laser cut tights - black
p prod = Product.find_by(name: "laser cut tights - black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)


# energy+ seamless sports bra
p prod = Product.find_by(name: "energy+ seamless sports bra")
p prod.colour = black
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: arms
  )

ProductStyle.create!(
  product: prod,
  style: belly
  )

p ProductStyle.where(product: prod)


# fit leggings

p prod = Product.find_by(name: "fit leggings")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )

ProductStyle.create!(
  product: prod,
  style: belly
  )

p ProductStyle.where(product: prod)

# flex strappy sports bra

p prod = Product.find_by(name: "flex strappy sports bra")
p prod.colour = black
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# flex high waisted leggings

p prod = Product.find_by(name: "flex high waisted leggings")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# ultra seamless sports bra - black
p prod = Product.find_by(name: "ultra seamless sports bra - black")
p prod.colour = black
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# ultra seamless leggings - black

p prod = Product.find_by(name: "ultra seamless leggings - black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# ultra seamless crop top - black
p prod = Product.find_by(name: "ultra seamless crop top - black")
p prod.colour = black
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)


# ultra seamless crop top - pink
p prod = Product.find_by(name: "ultra seamless crop top - pink")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)


# ultra seamless sports bra - pink
p prod = Product.find_by(name: "ultra seamless sports bra - pink")
p prod.colour = bright
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: belly
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# ultra seamless leggings - pink

p prod = Product.find_by(name: "ultra seamless leggings - pink")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# ultra seamless sports bra - green
p prod = Product.find_by(name: "ultra seamless sports bra - green")
p prod.colour = bright
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: belly
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# ultra seamless leggings - green
p prod = Product.find_by(name: "ultra seamless leggings - green")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# laser cut tank - blue
p prod = Product.find_by(name: "laser cut tank - blue")
p prod.colour = pastel
p prod.product_type = t_shirt
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# laser cut tights - blue
p prod = Product.find_by(name: "laser cut tights - blue")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# laser cut tank - salmon
p prod = Product.find_by(name: "laser cut tank - salmon")
p prod.colour = pastel
p prod.product_type = t_shirt
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)


# laser cut tights - salmon
p prod = Product.find_by(name: "laser cut tights - salmon")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# movement mesh crop top - black
p prod = Product.find_by(name: "movement mesh crop top - black")
p prod.colour = black
p prod.product_type = crop_top
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)


# movement mesh crop top - grey
p prod = Product.find_by(name: "movement mesh crop top - grey")
p prod.colour = neutral
p prod.product_type = crop_top
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# movement mesh crop top - pink
p prod = Product.find_by(name: "movement mesh crop top - grey")
p prod.colour = neutral
p prod.product_type = crop_top
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# movement mesh joggers - black
p prod = Product.find_by(name: "movement mesh joggers - black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)


# movement mesh joggers - grey
p prod = Product.find_by(name: "movement mesh joggers - grey")
p prod.colour = neutral
p prod.product_type = leggings
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# movement mesh leggings - black
p prod = Product.find_by(name: "movement mesh leggings - black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# movement mesh leggings - grey
p prod = Product.find_by(name: "movement mesh leggings - grey")
p prod.colour = neutral
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# movement mesh leggings - pink
p prod = Product.find_by(name: "movement mesh leggings - pink")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# power down vest
p prod = Product.find_by(name: "power down vest")
p prod.colour = black
p prod.product_type = t_shirt
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# power down croplette - beige
p prod = Product.find_by(name: "power down croplette - beige")
p prod.colour = neutral
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: belly
  )

p ProductStyle.where(product: prod)

# power down croplette - blue
p prod = Product.find_by(name: "power down croplette - blue")
p prod.colour = pastel
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: belly
  )

p ProductStyle.where(product: prod)

puts "###########################"
puts "#####PASSED FIRST TEST#####"
puts "###########################"


# power down shorts
p prod = Product.find_by(name: "power down shorts")
p prod.colour = black
p prod.product_type = shorts
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# power down leggings - blue
p prod = Product.find_by(name: "power down leggings - blue")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# power down leggings - bordeaux
p prod = Product.find_by(name: "power down leggings - bordeaux")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# power down sports bra - blue
p prod = Product.find_by(name: "power down sports bra - blue")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# power down sports bra - bordeaux
p prod = Product.find_by(name: "power down sports bra - bordeaux")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# sculpt long sleeve top
p prod = Product.find_by(name: "sculpt long sleeve top")
p prod.colour = black
p prod.product_type = hoodie
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# sculpt leggings - red
p prod = Product.find_by(name: "sculpt leggings - red")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)


# sculpt leggings - blue
p prod = Product.find_by(name: "sculpt leggings - blue")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# sculpt leggings - pink
p prod = Product.find_by(name: "sculpt leggings - pink")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# sculpt leggings - black
p prod = Product.find_by(name: "sculpt leggings - black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: waist
  )

p ProductStyle.where(product: prod)

# sculpt sports bra - red
p prod = Product.find_by(name: "sculpt sports bra - red")
p prod.colour = bright
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# sculpt sports bra - blue
p prod = Product.find_by(name: "sculpt sports bra - blue")
p prod.colour = bright
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# sculpt sports bra - pink
p prod = Product.find_by(name: "sculpt sports bra - pink")
p prod.colour = pastel
p prod.product_type = sports_bra
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: shoulders
  )
ProductStyle.create!(
  product: prod,
  style: arms
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Leggings - Jet Black
p prod = Product.find_by(name: "Hyperflex Seamless Leggings - Jet Black")
p prod.colour = black
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Leggings - Teal Green
p prod = Product.find_by(name: "Hyperflex Seamless Leggings - Teal Green")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Leggings - Lavender Purple
p prod = Product.find_by(name: "Hyperflex Seamless Leggings - Lavender Purple")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Leggings - Electric Blue
p prod = Product.find_by(name: "Hyperflex Seamless Leggings - Electric Blue")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Leggings - Ruby Red
p prod = Product.find_by(name: "Hyperflex Seamless Leggings - Ruby Red")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Crop - Jet Black
p prod = Product.find_by(name: "Hyperflex Seamless Crop - Jet Black")
p prod.colour = black
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Crop - Teal Green
p prod = Product.find_by(name: "Hyperflex Seamless Crop - Teal Green")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Crop - Lavender Purple
p prod = Product.find_by(name: "Hyperflex Seamless Crop - Lavender Purple")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Crop - Electric Blue
p prod = Product.find_by(name: "Hyperflex Seamless Crop - Electric Blue")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Hyperflex Seamless Crop - Ruby Red
p prod = Product.find_by(name: "Hyperflex Seamless Crop - Ruby Red")
p prod.colour = bright
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Trinity Seamless Leggings - Musk Pink
p prod = Product.find_by(name: "Trinity Seamless Leggings - Musk Pink")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Trinity Seamless Leggings - Soft Beige
p prod = Product.find_by(name: "Trinity Seamless Leggings - Soft Beige")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Trinity Seamless Leggings - Sky Blue
p prod = Product.find_by(name: "Trinity Seamless Leggings - Sky Blue")
p prod.colour = pastel
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Trinity Seamless Crop - Musk Pink
p prod = Product.find_by(name: "Trinity Seamless Crop - Musk Pink")
p prod.colour = pastel
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Trinity Seamless Crop - Soft Beige
p prod = Product.find_by(name: "Trinity Seamless Crop - Soft Beige")
p prod.colour = pastel
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Trinity Seamless Crop - Sky Blue
p prod = Product.find_by(name: "Trinity Seamless Crop - Sky Blue")
p prod.colour = pastel
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Impact Seamless Leggings - Earth Red
p prod = Product.find_by(name: "Impact Seamless Leggings - Earth Red")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Impact Seamless Leggings - Plum Purple
p prod = Product.find_by(name: "Impact Seamless Leggings - Plum Purple")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Impact Seamless Leggings - Olive Green
p prod = Product.find_by(name: "Impact Seamless Leggings - Olive Green")
p prod.colour = bright
p prod.product_type = leggings
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: waist
  )
ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Impact Seamless Crop - Earth Red
p prod = Product.find_by(name: "Impact Seamless Crop - Earth Red")
p prod.colour = pastel
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Impact Seamless Crop - Plum Purple
p prod = Product.find_by(name: "Impact Seamless Crop - Plum Purple")
p prod.colour = pastel
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Impact Seamless Crop - Olive Green
p prod = Product.find_by(name: "Impact Seamless Crop - Olive Green")
p prod.colour = pastel
p prod.product_type = crop_top
p prod.cut = tight
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: arms
  )
ProductStyle.create!(
  product: prod,
  style: shoulders
  )

p ProductStyle.where(product: prod)

# Athletica Running Shorts - Forest Green
p prod = Product.find_by(name: "Athletica Running Shorts - Forest Green")
p prod.colour = bright
p prod.product_type = shorts
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)

# Athletica Running Shorts - Pastel Pink
p prod = Product.find_by(name: "Athletica Running Shorts - Pastel Pink")
p prod.colour = bright
p prod.product_type = shorts
p prod.cut = loose
p prod.save!

prod_styles = ProductStyle.where(product: prod)
if prod_styles.length == 1
  prod_styles.first.destroy
else
  prod_styles.destroy_all
end

ProductStyle.create!(
  product: prod,
  style: legs
  )
ProductStyle.create!(
  product: prod,
  style: glutes
  )

p ProductStyle.where(product: prod)
