require_relative "instance_counter"
require_relative "manufacturer"
require_relative "station"
require_relative "train"
require_relative "route"
require_relative "passenger_train"
require_relative "cargo_train"
require_relative "wagon"
require_relative "passenger_wagon"
require_relative "cargo_wagon"

user_input = nil
station_list = Station.all
route = nil
trains = Train.trains_all

def choose_train(trains)
  puts 'Выберите номер поезда из списка'
  trains.each_key { |k| puts k }
  choice = gets.chomp
  trains[choice]
end

until user_input == 12

  puts 'Интерфейс управления'

  puts 'Выберите пункт меню:'
  puts '1 - Создать железнодорожную станцию'
  puts '2 - Создать маршрут'
  puts '3 - Добавить станцию в маршрут'
  puts '4 - Удалить станцию из маршрут'
  puts '5 - Создать поезд'
  puts '6 - Назначить маршрут поезду'
  puts '7 - Добавить вагоны поезду'
  puts '8 - Отцеплять вагоны от поезда'
  puts '9 - Перемещать поезд по маршруту: вперед'
  puts '10 - Перемещать поезд по маршруту: назад'
  puts '11 - Список станция и список поездов на станциях'
  puts '12 - Выйти'

  user_input = gets.to_i

  case user_input
    when 1
      name = gets.chomp
      Station.new(name)
    when 2
      puts 'Выберите начальную станцию'
        station_list.each { |x| puts x.name}
      first = gets.chomp
        station_one = station_list.detect { |x| x.name if x.name == first}
      puts "Введите конечную станцию: "
        station_list.each { |x| puts x.name}
      second = gets.chomp
        station_two = station_list.detect { |x| x.name if x.name == second}
      route = Route.new(station_one, station_two)
    when 3
      name = gets.chomp
      route.add_midway(Station.new(name))
    when 4
      name = gets.chomp
        station = route.stations.detect { |x| x.name if x.name == name}
      route.delete_midway_station(station)
    when 5
      number = gets.chomp
      puts "1 - Грузовой, 2 - Пассажирский "
      type = gets.to_i
        if type == 1
          Train.trains_all[number] = CargoTrain.new(number)
        else
          Train.trains_all[number] = PassengerTrain.new(number)
        end
    when 6
      train = choose_train(trains)
      train.receive_route(route)
      train.current_station.add_train(train)
    when 7
      train = choose_train(trains)
        if train.instance_of?(CargoTrain)
          train.add_wagon(CargoWagon.new)
        else
          train.add_wagon(PassengerWagon.new)
        end
    when 8
      train = choose_train(trains)
      train.remove_wagon(train.wagons.first)
    when 9
      train = choose_train(trains)
      train.move_forward(route)
      train.current_station.leave(train)
      train.next_station(route).add_train(train)
    when 10
      train = choose_train(trains)
      train.move_back(route)
      train.current_station.leave(train)
      train.previuos_station(route).add_train(train)
    when 11
      puts 'Cтанции : Поезда на них'
      station_trains_list = {}
        station_list.each do |x|
          station_trains_list[x.name] = x.trains.flatten
        end
      station_trains_list.each do |k, v|
        puts "Станция #{k}:"
        tr = []
        v.each { |x| tr << x.number}
        puts "Поезда - #{tr.join(", ")}"
      end
  end
end
