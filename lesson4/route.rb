class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_midway(station)
    stations.insert(-2, station)
  end

  def delete_midway_station(station)
    stations.delete_if do |x|
      x == station && x != (stations.first || stations.last)
    end
  end

  def print_station_list
    puts "Маршрут: #{stations.join(", ")}"
  end
end