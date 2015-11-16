require_relative 'CSVReader'
require_relative 'Counter'

class Calendar
  
  def initialize
    CSVReader.new.read
    sugar_per_day = []
  end

  def day
    (1..Counter::day).each do |day| 
      look_throught_harvest_by_day = @harvest_data.select {|item| item[:day] == day}
      look_throught_harvest_by_day.each {|item| sugar_per_day << sugar(item[:pollen_id], item[:mass])}
    end
  end

  def worst_day
    @harvest_data[day.min.index][:day]
  end

  def best_day
    @harvest_data[day.max.index][:day]
  end    
end