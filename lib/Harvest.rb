class Harvest
  attr_reader :bee_id, :day, :pollen_id, :mass
  
  def initialize(args)
    @bee_id    = args[:bee_id]
    @day       = args[:day]
    @pollen_id = args[:pollen_id]
    @mass      = args[:mass]
  end

  def self.popular
    # no-op
  end

end