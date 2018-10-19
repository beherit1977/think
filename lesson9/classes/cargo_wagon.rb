class CargoWagon < Wagon
  attr_accessor :number
  attr_reader :capacity, :occupied, :available

  validate :capacity, :presence
  validate :capacity, :type, Integer

  def initialize(capacity)
    @capacity = capacity
    validate!
    @occupied = 0
    @available = capacity
    @number = 0
  end

  def take_a_capacity(amount)
    @occupied += amount
    @available -= amount
  end
end
