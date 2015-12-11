#!/usr/bin/ruby -wKU
require_relative 'CsvReader'
require_relative 'counter'
require_relative 'sugarcalculator'

class Calendar
  attr_reader :sugar_per_day
  # Here I should make top-level documentation comment
  def initialize
    @table         = CsvReader.new.harvest_data
    @sugar_per_day = []
    @day_array     = Counter.new.day
  end

  def day_estimation
    @day_array.each do |day|
      daily_sugar(day)
    end
  end

  def by(day)
    @table.select do |item| 
       item[:day] == day
    end
  end

  def daily_sugar(day)
    sugar_array = []
    by(day).each do |item| 
      sugar_array << SugarCalculator.new(pollen_id: item[:pollen_id], mass: item[:mass]).sugar
    end
    @sugar_per_day << sugar_array.reduce(:+)
  end
  
  def worst_day
    day_estimation
    puts " The worst day for harvest was on #{@day_array[idx_min]}"
  end

  def best_day
    day_estimation
    puts "The best day for harvest was on #{@day_array[idx_max]}"
  end

  def idx_max
    @sugar_per_day.index { |x| x == sugar_per_day.max }
  end

  def idx_min
    @sugar_per_day.index { |x| x == sugar_per_day.min }
  end
end
