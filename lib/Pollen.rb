class Pollen
  attr_accessor :pollen_id, :name, :sugar_per_mg
  @@count = 0

  def initialize(args)
    @pollen_id    = args[:id]
    @name         = args[:name]
    @sugar_per_mg = args[:sugar_per_mg]
    @@count   += 1
  end

  def self.count
    @@count
  end  
  
end
