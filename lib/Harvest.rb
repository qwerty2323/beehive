class Harvest
  attr_reader :bee_id, :day, :pollen_id, :mass
  @@count = 0
  
  
  def initialize(args)
    @bee_id    = args[:bee_id]
    @day       = args[:day]
    @pollen_id = args[:pollen_id]
    @mass      = args[:mass]
    @@count   += 1
  end

  def self.count
    @@count
  end
  
end