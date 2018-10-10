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

# экземпляры для проверки работы кода
st1 = Station.new("Mos")
st2 = Station.new("Pet")
st3 = Station.new("Volg")
st4 = Station.new("Rost")
st5 = Station.new("Soch")

route = Route.new(st1, st4)
route.add_midway(st2)
route.add_midway(st3)
route.add_midway(st5)

tr1 = CargoTrain.new("aaaaa")
tr2 = CargoTrain.new("bbbbb")
tr3 = PassengerTrain.new("ccccc")

st1.add_train(tr1)

5.times { tr1.add_wagon(CargoWagon.new) }
7.times { tr3.add_wagon(PassengerWagon.new) }

def choose_train(trains)
  puts 'Выберите номер поезда из списка'
  trains.each_key { |k| puts k }
  choice = gets.chomp
  trains[choice]
end

until user_input == 13

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
  puts '12 - Занять объем или места в вагоне'
  puts '13 - ВЫХОД'

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
      number = nil
      type = nil

      while number !~ /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i
        puts "Введите номер поезда:"
        number = gets.chomp

        until type == 1 || type == 2
          puts "1 - Грузовой, 2 - Пассажирский "
          type = gets.to_i

            begin
              raise "You must enter 1 or 2" unless type == 1 || type == 2
              rescue RuntimeError => error
              puts error
            end

          if type == 1
            Train.trains_all[number] = CargoTrain.new(number)
          else
            Train.trains_all[number] = PassengerTrain.new(number)
          end
        end

        puts "Поезд #{number} успешно создан"
      end
    when 6
      train = choose_train(trains)
      train.receive_route(route)
      train.current_station.add_train(train)
    when 7
      train = choose_train(trains)
        if train.instance_of?(CargoTrain)
          puts "Какой объем вагона?"
          capacity = gets.to_i
          train.add_wagon(CargoWagon.new(capacity))
        else
          puts "На сколько мест вагон?"
          seats = gets.to_i
          train.add_wagon(PassengerWagon.new(seats))
        end
    when 8
      train = choose_train(trains)
      train.remove_wagon(train.wagons.first)
    when 9
      puts 'Выберите поезд:'
      train = choose_train(trains)
      train.current_station.leave(train)
      train.move_forward(route)
      train.current_station.add_train(train)
    when 10
      puts 'Выберите поезд:'
      train = choose_train(trains)
      train.current_station.leave(train)
      train.move_back(route)
      train.current_station.add_train(train)
    when 11
      puts 'Маршрут:'
      puts route.stations.map { |s| s.name}.join(" --> ")

      puts 'Cтанции : Поезда на них'
      station_list.each do |st|
        st.each_train do |t|
          puts "Поезд #{t.number}, Тип: #{t.train_type(t)}, "\
          "#{t.wagon_count} вагонов"

          t.each_wagon do |w|
            if w.instance_of?(CargoWagon)
              puts "Вагон № #{w.number}, Тип: Грузовой, Свободный объем: "\
              "#{w.available}, Занято: #{w.occupied}"
            else
              puts "Вагон № #{w.number}, Тип: Пассажирский, "\
              "Свободно: #{w.available} мест, Занято: #{w.occupied}"
            end
          end
        end
      end
    when 12
      puts 'Занять объем или места в вагоне'
      train = choose_train(trains)
      puts 'Выберите номер вагона'
      train.wagons.each { |w| puts w.number }
        choice = gets.to_i
        wagon = train.wagons.detect { |x| x.number if x.number == choice}

        if wagon.instance_of?(CargoWagon)
          puts 'Введите занимаемый объем'
          amount = gets.to_i
          wagon.take_a_capacity(amount)
        else
          puts 'Резервирую место в вагоне'
          wagon.take_a_seat
        end
  end
end
