require './modules/validation'
require './modules/accessors'
require './modules/instance_counter'
require './modules/manufacturer'
require './classes/station'
require './classes/train'
require './classes/route'
require './classes/passenger_train'
require './classes/cargo_train'
require './classes/wagon'
require './classes/passenger_wagon'
require './classes/cargo_wagon'

# проверка работы новых модулей
# attr_accessor_with_history
st1 = Station.new('Podolsk')
st2 = Station.new('Tula')

Station.attr_accessor_with_history('rating', 'size')
st1.size = 2000
st1.size = 5000
p st1.size_history

st2.rating = 'dangerous'
st2.rating = 'good'
p st2.rating_history

tr1 = CargoTrain.new('aaaaa')

Train.attr_accessor_with_history('condition')

tr1.condition = 'average'
tr1.condition = 'after renovation'
p tr1.condition_history

r = Route.new('Mos', 'Volg')

Route.attr_accessor_with_history('length')
r.length = 1500
r.length = 900
r.length = 1800
p r.length_history

# strong_attr_accessor
Station.strong_attr_accessor('director', String)

p st1.director = 'Ivanov'
p st2.director = 'ksks'
# p st2.director = 88

# тесты validations модуля
# p st4 = Station.new("")
# p st5 = Station.new(nil)
# p st4 = Station.new(Integer)

# p tr3 = CargoTrain.new("")
# p tr3 = CargoTrain.new(12345)
# p tr3 = CargoTrain.new('aaaa')

# p w = CargoWagon.new('')
# p w = PassengerWagon.new('abc')
