require_relative 'CsvReader'
require_relative 'counter'
require_relative 'sugarcalculator'

class Efficiency
  attr_reader :eff_rating
  # Here I should make top-level documentation comment  
  def initialize
    @table       ||= CsvReader.new.harvest_data
    @eff_rating  ||= []
    
  end

  def efficiency_rating
   Counter.new.bee.each do |bee_id|
      @eff_rating << efficiency(bee_id)
   end
   @eff_rating
  end

  def efficiency(bee_id)
    harvested_sugar(bee_id) / workdays(bee_id)
  end

  def by(bee_id)
    @table.select { |item| item[:bee_id] == bee_id }
  end

  def workdays(bee_id)
    by(bee_id).size
  end

  def harvested_sugar(bee_id)
    values = []
    by(bee_id).each do |item|
      values << sugar(item[:pollen_id], item[:mass]) 
    end
    values.reduce(:+)
  end

  def sugar(id, mass)
    SugarCalculator.new(pollen_id: id, mass: mass).sugar
  end

  def most_efficient
    efficiency_rating[idx_max][:bee_id]
  end

  def least_efficient
    efficiency_rating[idx_min][:bee_id]
  end

  def idx_max
    eff_rating.index { |x| x == eff_rating.max }
  end

  def idx_min
    eff_rating.index { |x| x == eff_rating.min }
  end  
end
