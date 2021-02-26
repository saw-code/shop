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
require_relative 'lib/disk'
require_relative 'lib/collection_product'

collection = CollectionProduct.from_dir("#{__dir__}/data")
collection.sort!(by: :price)

basket = []
total_price = 0

loop do
  puts "Что хотите купить:"
  puts

  collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
  puts
  puts "0. Выход"
  puts

  user_input = STDIN.gets.to_i
  break if user_input == 0

  price = collection.to_a.map { |element| element.price }
  collection.to_a[user_input - 1].amount -= 1
  basket << collection.to_a[user_input - 1]


  puts "Вы выбрали: #{collection.to_a[user_input - 1]}"
  puts "Всего товаров на сумму: #{total_price += price[user_input - 1]}"

  puts
end

puts "Вы купили:"
puts
puts basket
puts
puts "С Вас - #{total_price} руб. Спасибо за покупку"
