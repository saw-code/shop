class Basket
  attr_accessor :products

  def initialize
    @products = []
  end

  def add(product)
    @products << product
  end

  def total_price
    @products.sum(&:price)
  end

  def to_s
    @products.uniq.map do |product|
      "#{product} #{@products.count(product)} x #{@products.count(product) * product.price}"
    end
    .join("\n")
  end
end
