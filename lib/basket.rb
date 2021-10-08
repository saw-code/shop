class Basket
  attr_accessor :products

  def initialize
    @products = []
  end

  def add(product)
    product.count += 1
    @products << product
  end

  def total_price
    @products.sum(&:price)
  end
end
