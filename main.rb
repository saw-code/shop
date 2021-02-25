if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/collection_product'

collection = CollectionProduct.from_dir("#{__dir__}/data")

# Сортируем продукты по возрастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :title)

# Получаем массив продуктов методом to_a и выводим каждый на экран, передавая
# его методу puts в качестве аргумента.
collection.to_a.each do |product|
  puts product
end
