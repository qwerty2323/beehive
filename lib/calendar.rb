require_relative 'CsvReader'
require_relative 'counter'

class Calendar
  
  # Here I should make top-level documentation comment
  def initialize
    CsvReader.new.read
    sugar_per_day = []
  end

  def day
    (1..Counter.new.day).each do |day| 
      look_throught_harvest_by_day = @harvest_data.select do |item| 
        item[:day] == day
      end
      look_throught_harvest_by_day.each do |item| 
        sugar_per_day << sugar(item[:pollen_id], item[:mass])
      end
    end
  end

  def worst_day
    @harvest_data[day.min.index][:day]
  end

  def best_day
    @harvest_data[day.max.index][:day]
  end
end
