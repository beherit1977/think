class PassengerWagon < Wagon
  attr_accessor :number
  attr_reader :seats, :occupied, :available

  validate :seats, :presence
  validate :seats, :type, Integer

  def initialize(seats)
    @seats = seats
    validate!
    @occupied = 0
    @available = seats
    @number = 0
  end

  def take_a_seat
    @occupied += 1
    @available -= 1
  end
end
