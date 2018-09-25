class Train
  attr_reader :speed, :wagons, :number, :current_station

  def
    initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end

  def accelerate(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    self.stop
    @wagons << wagon
  end

  def remove_wagon(wagon)
    self.stop
    @wagons.delete(wagon)
  end

  def wagon_count
    @wagons.count
  end

  def receive_route(route)
    @current_station = route.stations[0]
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

  protected # внутрений метод класса
  def last_station?(route)
    route.stations.last == @current_station
  end

  def first_station?(route)
    route.stations.first == @current_station
  end
end
