puts 'Ряд Фибоначчи до 100'
arr = [1]
counter = 1

while counter <= 100
  arr << counter
  counter += arr[-2]
end

puts arr.to_s
