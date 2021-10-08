require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/collection_product'
require_relative 'lib/basket'

collection = CollectionProduct.from_dir("#{__dir__}/data")
collection.sort!(by: :price)
basket = Basket.new
total_price = 0

loop do
  puts "Что хотите купить:"
  puts

  collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product} (осталось #{product.amount})"
  end

  puts
  puts "0. Выход"
  puts

  user_input = STDIN.gets.to_i
  collection_size = collection.to_a.size

  while user_input > collection_size || user_input.negative?
    print "введите верный номер товара: "
    user_input = STDIN.gets.to_i
  end

  break if user_input == 0
  user_input -= 1

  product = collection.to_a[user_input]

  if product.amount.positive?
    basket.add(product)
    total_price = basket.total_price
    product.amount -= 1
    puts "Вы выбрали: #{product.showcase}"

    puts "В вашей корзине сейчас:"
    puts basket.products.uniq

    puts "Всего товаров на сумму: #{total_price}"

    if product.amount.zero?
      puts "Товар закончился"
      collection.to_a.delete(product)
    end
  end

  if collection.to_a.empty?
    puts "Вы купили вообще все. Ничего больше нет"
    break
  end
end

puts "Итого, вы купили:"
puts
puts basket.products.uniq
puts
puts "С Вас - #{total_price} руб. Спасибо за покупку"
