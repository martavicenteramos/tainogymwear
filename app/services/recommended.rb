class Recommended
  def initialize()
  end

  def recomend_products(current_user)
    # find all other users, equivalent to .where(‘id != ?’, self.id)
    other_users = User.all.where.not(id: current_user.id)
    # instantiate a new hash, set default value for any keys to 0
    recommended = Hash.new(0)
    # for each user of all other users
    other_users.each do |user|
    # find the products this user and another user both bought
      common_products = user.products & current_user.products
      # calculate the weight (recommendation rating)
      if user.products.size == 0
        size =1
      else
        size = user.products.size
      end
      weight = common_products.size.to_f / size
       # add the extra products the other user bought
       array = user.products
       array = array - common_products
        array.each do |product|
        # put the movie along with the cumulative weight into hash
        recommended[product] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end

  def question_products(current_user)
    user = current_user
    search = calculate_questions(user)
    a = Colour.where(name: search[0].first[0])
    b = Cut.where(name: search[1].first[0])
    c = ProductType.where(name: search[2][0]) # Sports Bra doesnt work
    d = Style.where(name: search[3].first[0])
    best_products = []
    best_products << best_match(search)
  end

  def calculate_questions(user)
    # Returns the array of hashes
    # Each Hash is sorted to by key value pairs from
    # the highest numnber to the lowest
    colour = { Black: 0, Pastel: 0, Bright: 0, Neutral: 0 }
    type = { Sports_Bra: 0, Leggings: 0, Crop_Top: 0, T_shirt: 0, Shorts: 0, Hoodie: 0 }
    style = { Shoulders: 0, Belly: 0, Arms: 0, Waist: 0, Legs: 0, Glutes: 0 }
    user.styles.each do |user_sty|
      style[user_sty.name.to_sym] += 1
    end
    user.colours.each do |user_col|
      colour[user_col.name.to_sym] += 1
    end
    user.product_types.each do |user_prod|
      type[user_prod.name.gsub(/\s+|-/, "_").to_sym] += 1
    end
    #Sorts out in the decending order
    colour = colour.sort_by { |_k, v| v }.reverse
    cut = cut.sort_by { |_k, v| v }.reverse
    type = type.sort_by { |_k, v| v }.reverse
    style = style.sort_by { |_k, v| v }.reverse



    return [colour, cut, type, style]
  end

  def best_match(search)
    # Search is an array of hashes in this order
    # colour, cut, type, style
    # This function returns the best match search
    a = Colour.where(name: search[0].first[0])
    b = Cut.where(name: search[1].first[0])
    c = ProductType.where(name: search[2][0]) # Sports Bra doesnt work
    d = Style.where(name: search[3].first[0])

    best_style = Style.where(name: d.first.name)[0].products
    best_colour = @products.where(colour_id: a)
    best_cut = @products.where(cut_id: b)
    best_type = @products.where(product_type_id: c)

    #Returns the array of products
    best_products = @best_style.where(colour_id: a).where(cut_id: b).where(product_type_id: c)
  end

end


