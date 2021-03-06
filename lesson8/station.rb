class Station
  include InstanceCounter

  attr_reader :trains, :name

  class << self
    attr_reader :all_stations
  end

  @all_stations = []

  def self.all
    @all_stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    self.class.all_stations << self
    register_instance
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def each_train
    @trains.each { |train| yield train }
  end

  def add_train(train)
    @trains << train
  end

  def list_cargo_trains
    @trains.select { |x| x.class == CargoTrain }
  end

  def list_passenger_trains
    @trains.select { |x| x.class == PassengerTrain }
  end

  def count_cargo
    @trains.count { |x| x.class == CargoTrain }
  end

  def count_passenger
    @trains.count { |x| x.class == PassengerTrain }
  end

  def leave(train)
    @trains.delete(train)
  end

  protected

  def validate!
    raise 'Name should be at least 3 chars long' if name.length < 3

    true
  end
end
