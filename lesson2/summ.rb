result = {}
total = 0

loop do
  puts 'Введите название товара или напишите стоп'
  name = gets.chomp
  break if name == 'стоп'
  puts 'Введите цену товара:'
  price = gets.to_f
  puts 'Введите количество товара'
  q = gets.to_f

  result[name] = {'price' => price, 'total' => q}
end

puts result

result.each do |name, hash|
  sum = result[name]['price'] * result[name]['total']
  total += sum

  puts " #{name} : #{sum} rub"
end

puts "Всего к оплате: #{total}"
