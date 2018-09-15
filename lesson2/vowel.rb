puts 'Вывод гласных букв'

abc = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'.split('')
letters = {}
vowels = 'аеёиоуыэюя'.split('')

abc.each_with_index do |el, i|
  letters[el] = i + 1 if vowels.include?(el)
end

letters.each do |k, v|
  puts "#{k} - #{v}"
end
