class Pollen
  attr_accessor :pollen_id, :name, :sugar_per_mg

  def initialize(args)
    @pollen_id    = args[:pollen_id]
    @name         = args[:name]
    @sugar_per_mg = args[:sugar_per_mg]
  end

end
