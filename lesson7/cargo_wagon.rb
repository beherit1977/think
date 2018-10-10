class CargoWagon < Wagon

  attr_accessor :number
  attr_reader :capacity, :occupied, :available

  def initialize( capacity = 10)
    @capacity = capacity
    @occupied = 0
    @available = capacity
    @number = 0
  end

  def take_a_capacity(amount)
    @occupied += amount
    @available -= amount
  end
end
