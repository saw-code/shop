class CollectionProduct
  PRODUCT_TYPES = {
    film: { dir: 'films', class: Film },
    book: { dir: 'books', class: Book },
    disk: { dir: 'disk', class: Disk }
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)

    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir] # 'films'
      product_class = hash[:class] # 'Film'

      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price.to_i }
    when :amount
      @products.sort_by! { |product| product.amount.to_i }
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end
