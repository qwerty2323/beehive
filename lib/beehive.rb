require_relative 'calendar'
require_relative 'efficiency'
require_relative 'popularity'
require_relative 'sugarcalculator'

puts "The most sugar was produces from #{Sugar.new.most_sugar} pollen"
puts "The most efficient bee is #{Efficiency.new.most_efficient}"
puts "The least efficient bee is #{Efficiency.new.least_efficient}"
puts "The most popular pollen was #{Popularity.new.popular}"
puts "The best day for harvest was #{Calendar.new.best_day}"
puts "The worst day for harvest was #{Calendar.new.worst_day}"

def most_sugar
  # For each pollen we calculate combined mass, which was harvested.
  # Then, we calculate total sugar with SugarCalculator
  
end

