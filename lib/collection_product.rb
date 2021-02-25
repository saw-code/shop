class CollectionProduct

    PRODUCT_TYPES = {
      film: {dir: 'films', class: Film},
      book: {dir: 'books', class: Book}
    }

    def initialize(products = [])
      @products = products
    end

    def self.from_dir(dir_path)

      products = []
      # Сначала в type будет :film, а в hash — {dir: 'films', class: Film}, потом
      # в type будет :book, а в hash — {dir: 'books', class: Book}
      PRODUCT_TYPES.each do |type, hash|

        product_dir = hash[:dir] # 'films'

        product_class = hash[:class] # 'Film'

        Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
          products << product_class.from_file(path)
        end
      end

      self.new(products)
    end

    def to_a # Простой метод, чтобы достать все продукты коллекции
      @products
    end

  # Метод sort! меняет экземпляр класса ProductCollection (меняет порядок)
  # продуктов в коллекции, поэтому он назвал с восклицательным знаком. Этот
  # метод принимает на вход ассоциативный массив, в котором могут быть два
  # ключа: :by и :order. Например, чтобы отсортировать продукты по возрастанию
  # цены, можно вызвать этот метод так:
  #
  # collection.sort!(by: :price, order: :asc)
    def sort!(params)
      # Делает выбор по параметру by
      case params[:by]
      when :title
        # Если запросили сортировку по наименованию
        @products.sort_by! { |product| product.to_s }
      when :price
        # Если запросили сортировку по цене
        @products.sort_by! { |product| product.price.to_i }
      when :amount
        # Если запросили сортировку по количеству
        @products.sort_by! { |product| product.amount.to_i }
      end

      # Если запросили сортировку по возрастанию
      @products.reverse! if params[:order] == :asc

      # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
      # другие методы.
      self
    end
end
