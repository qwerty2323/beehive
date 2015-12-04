require_relative 'CSVReader'
require_relative 'counter'

class Efficiency

  # Here I should make top-level documentation comment  
  def initialize
    CSVReader.new.read
    eff_rating = []
  end

  def efficiency
    (1..Counter.new.bee).each do |bee_id|
      harvested_sugar = []
      look_throught_harvest_by_bee_id = @harvest_data.select { |item| item[:bee_id] == bee_id }
      look_throught_harvest_by_bee_id.each do |item|
        harvested_sugar << sugar([:pollen_id], item[:mass])
      end
      eff_rating << harvested_sugar.reduce(:+) /
        look_throught_harvest_by_bee_id.count
    end
  end

  def most_effient
    @harvest_data[efficiency.max.index][:bee_id]
  end

  def least_effient
    @harvest_data[efficiency.min.index][:bee_id]
  end
end
