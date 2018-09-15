puts 'Назовите день'
day = gets.to_i
puts 'Назовите номер месяца'
month = gets.to_i
puts 'Назовите год'
year = gets.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days[1] = 29 if  year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)

day_number = days.take(month - 1).reduce(0) { |sum, x| sum + x } + day

puts "Номер дня #{day_number}"
