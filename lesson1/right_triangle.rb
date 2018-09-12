puts 'Прямоугольный треугольник'

puts 'Первая сторона'
a = gets.to_f
puts 'Вторая сторона'
b = gets.to_f
puts 'Третья сторона'
c = gets.to_f

gipotenuse = [a, b, c].max

katets = [a, b, c].sort.take(2)

summ = katets.inject(0) { |summ, x| summ += x**2 }

if  gipotenuse**2 == summ
  puts 'Это прямоугольный треугольник'

  if katets[0] == katets[1]
    puts 'Треугольник равнобедренный и прямоугольный'
  end
else
  puts 'Не прямоугольный треугольник'
end
