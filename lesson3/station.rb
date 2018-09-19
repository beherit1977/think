class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def list_trains
    @trains
  end

  def list_cargo_trains
    @trains.select {|x| x.type == "cargo"}
  end

  def list_passenger_trains
    @trains.select {|x| x.type == "passenger"}
  end

  def count_cargo
    @trains.count {|x| x.type == "cargo"}
  end

  def count_passenger
    @trains.count {|x| x.type == "passenger"}
  end

  def leave(train)
    @trains.delete(train)
  end
end
