class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
  end

  def valid?
    validate!
    rescue
    false
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

  protected
  def validate!
    raise "You must create at least 2 stations first" if Station.all.size < 2
    true
  end
end
