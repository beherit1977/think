puts "Решение квадратного уровнения"
puts "Введите а"
a = gets.to_f
puts "Введите b"
b = gets.to_f
puts "Введите с"
c = gets.to_f

d = (b * b) - (4 * a * c)

if d >= 0
 x1 = (-b + Math.sqrt(d)) / (2 * a)
 x2 = (-b - Math.sqrt(d))/ (2 * a )
 puts "Дискриминант = #{d}"
  if
    x1 == x2
    puts "Корень1: #{x1}"
  else
    puts "Корень1: #{x1} Корень2: #{x2}"
  end
else
  puts "Дискриминант = #{d}"
  puts "В уравнении нет корней"
end