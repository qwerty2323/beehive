require_relative 'CSVReader'
require_relative 'counter'

class Sugar

  # Here I should make top-level documentation comment
  def initialize
    CSVReader.new.read
    sugar_per_pollen = []
  end

  def sugar(pollen_id, mass)
    pollen_row   = @pollen_data.find { |item| item[:pollen_id] == pollen_id }
    sugar_per_mg = pollen_row[:sugar_per_mg]
    harvest_row  = @harvest_data.find { |item| item[:mass] == mass }
    mass         = harvest_row[:mass]
    sugar_per_mg * mass
  end

  def most_sugar # This shit doesn't work properly. Plus it's to big - break it apart
    (1..Counter.new.pollen).each do |pollen_id|
      sugar_for_day = []
      look_through_harvest_by_pollen_id.each do |item|
        sugar_for_day << sugar(item[:pollen_id], item[:mass]) 
      end
      sugar_per_pollen << sugar_for_day.reduce(:+)
    end
    @pollen_data[sugar_per_pollen.max.index][:name]
  end
end
