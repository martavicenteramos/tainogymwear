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
  prod_styles.destroy
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

# "non stop leggings"

# "non stop leggings"
# "laser cut sports bra"
# "laser cut tights"
# "energy+ seamless sports bra"
# "fit leggings"
# "flex strappy sports bra"
# "flex high waisted leggings"
# "ultra seamless sports bra"
# "ultra seamless leggings"
# "ultra seamless crop top"
# "ultra seamless crop top"
# "ultra seamless sports bra"
# "ultra seamless leggings"
# "ultra seamless sports bra"
# "ultra seamless leggings"
# "laser cut tank"
# "laser cut tights"
# "laser cut tank"
# "laser cut tights"
# "movement mesh crop top"
# "movement mesh crop top"
# "movement mesh crop top"
# "movement mesh joggers"
# "movement mesh joggers"
# "movement mesh leggings"
# "movement mesh leggings"
# "movement mesh leggings"
# "power down vest"
# "power down long sleeve bodysuit"
# "power down long sleeve bodysuit"
# "power down jumpsuit"
# "power down croplette"
# "power down croplette"
# "power down shorts"
# "power down leggings"
# "power down sports bra"
# "power down leggings"
# "power down sports bra"
# "sculpt long sleeve top"
# "sculpt leggings"
# "sculpt sports bra"
# "sculpt leggings"
# "sculpt sports bra"
# "sculpt leggings"
# "sculpt sports bra"
# "sculpt leggings"
# "Hyperflex Seamless Leggings - Jet Black"
# "Hyperflex Seamless Leggings - Teal Green"
# "Hyperflex Seamless Leggings - Lavender Purple"
# "Hyperflex Seamless Leggings - Electric Blue"
# "Hyperflex Seamless Leggings - Ruby Red"
# "Hyperflex Seamless Crop - Jet Black"
# "Hyperflex Seamless Crop - Teal Green"
# "Hyperflex Seamless Crop - Lavender Purple"
# "Hyperflex Seamless Crop - Electric Blue"
# "Hyperflex Seamless Crop - Ruby Red"
# "Trinity Seamless Leggings - Musk Pink"
# "Trinity Seamless Leggings - Soft Beige"
# "Trinity Seamless Leggings - Sky Blue"
# "Trinity Seamless Crop - Musk Pink"
# "Trinity Seamless Crop - Soft Beige"
# "Trinity Seamless Crop - Sky Blue"
# "Impact Seamless Leggings - Earth Red"
# "Impact Seamless Leggings - Plum Purple"
# "Impact Seamless Leggings - Olive Green"
# "Impact Seamless Crop - Earth Red"
# "Impact Seamless Crop - Plum Purple"
# "Impact Seamless Crop - Olive Green"
# "Athletica Running Shorts - Forest Green"
# "Athletica Running Shorts - Pastel Pink"
# "camo seamless leggings"



