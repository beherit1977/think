puts 'Решение квадратного уровнения'
puts 'Введите а'
a = gets.to_f
puts 'Введите b'
b = gets.to_f
puts 'Введите с'
c = gets.to_f

d = (b * b) - (4 * a * c)
puts "Дискриминант = #{d}"
d_sqrt = Math.sqrt(d)

if d > 0
  x1 = (-b + d_sqrt) / (2 * a)
  x2 = (-b - d_sqrt) / (2 * a)
 puts "Корень1: #{x1} Корень2: #{x2}"
elsif d == 0
  puts "Корень1: #{x1}"
else
  puts 'В уравнении нет корней'
end