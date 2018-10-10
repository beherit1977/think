class PassengerWagon < Wagon

  attr_accessor :number
  attr_reader :seats, :occupied, :available

  def initialize(seats = 35)
    @seats = seats
    @occupied = 0
    @available = seats
    @number = 0
  end

  def take_a_seat
    @occupied += 1
    @available -= 1
  end
end
