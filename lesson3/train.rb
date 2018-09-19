class Train
  attr_reader :type, :current_station, :wagon_count, :speed

  def
    initialize(number, type, wagon_count)
    @number = number
    @type = type
    @speed = 0
    @wagon_count = wagon_count
  end

  def accelerate(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def add_wagon
    self.stop
    @wagon_count += 1
  end

  def remove_wagon
    self.stop
    @wagon_count -= 1
  end

  def recive_route(route)
    @current_station = route.stations[0]
  end

  def last_station?(route)
    route.stations.last == @current_station
  end

  def first_station?(route)
    route.stations.first == @current_station
  end

  def move_forward(route)
    return "No moving forward" if last_station?(route)
    @current_station = route.stations[route.stations.index(@current_station) + 1]
  end

  def move_back(route)
    return "No moving back" if first_station?(route)
    @current_station = route.stations[route.stations.index(@current_station) - 1]
  end

  def next_station(route)
    return "No next station" if last_station?(route)
    route.stations[route.stations.index(@current_station) + 1]
  end

def previuos_station(route)
    return "No previuos station"if first_station?(route)
    route.stations[route.stations.index(@current_station) - 1]
  end
end
