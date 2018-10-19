class CargoTrain < Train
  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, TRAIN_NUMBER
end
