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
    sorted_recommended = sorted_recommended.map(&:first)
  end

  def calculate_questions(user)
    a = user.colours # test is the user
    b = user.cut
    c = user.product_types
    d = Style.where(id: user.styles.ids)

    array = Product.joins(:product_styles).where(:product_styles => {:style_id => user.styles.ids })
    array = array.where(:colour_id => a.ids).where(cut_id: b).where(product_type_id: c)
  end

end


