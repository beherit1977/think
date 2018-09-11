puts "Программа идеальный вес"

puts "Напишите ваш рост:"
growth = gets.to_i
puts "Ваше имя:"
name = gets.chomp

ideal_weight = growth - 110

if ideal_weight < 0
  puts "Ваш вес уже оптимальный"
else
  puts "Уважаемый(ая) #{name}, Ваш идеальный вес: #{ideal_weight}кг"
end
