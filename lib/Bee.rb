class Bee
  attr_accessor :id
  @@count = 0

  def initialize(args)
    @id = args[:id]
    @@count += 1
  end

  def self.count
  @@count
  end

end