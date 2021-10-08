class Product
  attr_accessor :price, :amount, :count

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @count = 0
  end

  def showcase
    "#{@price} руб."
  end

  def to_s
    if @count.positive?
      "#{@price} руб. x #{@count} = #{@count * @price}"
    else
      "#{@price} руб."
    end
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def self.from_file(path)
    raise NotImplementedError
  end
end
