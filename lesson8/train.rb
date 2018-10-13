class Train
  include InstanceCounter
  include Manufacturer

  TRAIN_NUMBER = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i

  attr_reader :speed, :wagons, :number, :current_station, :trains

  @@trains = {}

  def self.trains_all
    @@trains
  end

  def self.find(num)
    @@trains[num]
  end

  def
    initialize(number)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance
    @counter = 0
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def train_type(train)
    train.instance_of?(CargoTrain) ? 'Грузовой' : 'Пассажирский'
  end

  def accelerate(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def each_wagon
    @wagons.each { |wagon| yield wagon }
  end

  def wagon_counter
    @counter += 1
  end

  def add_wagon(wagon)
    stop
    wagon.number += wagon_counter
    @wagons << wagon
  end

  def remove_wagon(wagon)
    stop
    @wagons.delete(wagon)
  end

  def wagon_count
    @wagons.count
  end

  def receive_route(route)
    @current_station = route.stations[0]
  end

  def move_forward(route)
    return 'No moving forward' if last_station?(route)

    @current_station =
      route.stations[route.stations.index(@current_station) + 1]
  end

  def move_back(route)
    return 'No moving back' if first_station?(route)

    @current_station =
      route.stations[route.stations.index(@current_station) - 1]
  end

  def next_station(route)
    raise 'No next station' if last_station?(route)

    route.stations[route.stations.index(@current_station) + 1]
  end

  def previuos_station(route)
    raise 'No previuos station' if first_station?(route)

    route.stations[route.stations.index(@current_station) - 1]
  end

  protected

  def validate!
    raise 'Wrong train number format' if number !~ TRAIN_NUMBER
  rescue RuntimeError => e
    puts e
  end

  def last_station?(route)
    route.stations.last == @current_station
  end

  def first_station?(route)
    route.stations.first == @current_station
  end
end
