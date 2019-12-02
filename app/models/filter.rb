class Filter
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(query = {})
    @query = query
  end

  def filter(products)
    products = products.global_search(cut) if cut.present?
    products = products.global_search(colour) if colour.present?
    products = products.global_search(style) if style.present?
    products = products.global_search(type) if type.present?

    products
  end

  def cut
    @query[:cut]
  end

  def colour
    @query[:colour]
  end

  def style
    @query[:style]
  end

  def type
    @query[:type]
  end
end
