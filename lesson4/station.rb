class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def list_cargo_trains
    @trains.select {|x| x.class == CargoTrain}
  end

  def list_passenger_trains
    @trains.select {|x| x.class == PassengerTrain}
  end

  def count_cargo
    @trains.count {|x| x.class == CargoTrain}
  end

  def count_passenger
    @trains.count {|x| x.class == PassengerTrain}
  end

  def leave(train)
    @trains.delete(train)
  end
end
