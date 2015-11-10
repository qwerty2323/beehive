class Pollen
  attr_accessor :id, :sugar_per_mg
  @@count = 0

  def initialize(args)
    @id           = args[:id]
    @sugar_per_mg = args[:sugar_per_mg]
    @@count      += 1
  end

  def self.count
    @@count
  end

end