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
end
