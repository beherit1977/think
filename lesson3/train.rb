class Train
  attr_accessor :speed
  attr_reader :type, :current_station, :wagon_count

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

  def move_forward(route)
    if route.stations.last == @current_station
      return "No moving forward"
    end
    @current_station = route.stations[route.stations.index(@current_station) + 1]
  end

  def move_back(route)
    if route.stations.first == @current_station
      return "No moving back"
    end
    @current_station = route.stations[route.stations.index(@current_station) - 1]
  end

  def next_station(route)
    if route.stations.last == @current_station
      return "No next station"
    end
    route.stations[route.stations.index(@current_station) + 1]
  end

def previuos_station(route)
    if route.stations.first == @current_station
      return "No previuos station"
    end
    route.stations[route.stations.index(@current_station) - 1]
  end
end
