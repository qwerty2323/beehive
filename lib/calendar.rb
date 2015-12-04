require_relative 'CsvReader'
require_relative 'counter'
require_relative 'sugarcalculator'

class Calendar
  
  # Here I should make top-level documentation comment
  def initialize
    @table         ||= CsvReader.new.harvest_data
    @sugar_per_day ||= []
  end

  def day_estimation
    Counter.new.day.each do |day|
      daily_sugar(day)
    end
  end

  def by(day)
    @table.select do |item| 
       item[:day] == day
    end
  end

  def daily_sugar(day)
    by(day).each do |item| 
      @sugar_per_day << SugarCalculator.new(pollen_id: item[:pollen_id], mass: item[:mass]).sugar
    end
  end
  
  def worst_day
    @sugar_per_day[idx_min][:day]
  end

  def best_day
    @sugar_per_day[idx_max][:day]
  end

  def idx_max
    @sugar_per_day.index { |x| x == sugar_per_day.max }
  end

  def idx_min
    @sugar_per_day.index { |x| x == sugar_per_day.min }
  end 
end
