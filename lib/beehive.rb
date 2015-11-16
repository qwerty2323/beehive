require_relative 'Pollen'
require_relative 'Harvest'
require_relative 'CSVReader'
require_relative 'Counter'

include Counter

data = CSVReader.new
data.read

def efficiency
  eff_rating = []
  (1..bee).each do |bee_id|
    harvested_sugar = []
    look_throught_harvest_by_bee_id = @harvest_data.find {|item| item[:bee_id] == bee_id}
    look_throught_harvest_by_bee_id.each{|item| harvested_sugar << sugar([:pollen_id], item[:mass])}
    eff_rating << harvested_sugar.reduce(:+)/look_throught_harvest_by_bee_id.count
  end
end

def sugar(pollen_id, mass)   
  pollen_row   = @pollen_data.find {|item| item[:pollen_id] == pollen_id}
  sugar_per_mg = row[:sugar_per_mg]
  harvest_row  = @harvest_data.find {|item| item[:mass] == mass}
  mass         = row[:mass]
  return sugar_per_mg * mass 
end

def most_sugar
  sugar_per_pollen = []
  (1..pollen).each do |pollen_id|
    sugar_for_day = []
    look_through_harvest_by_pollen_id.each {|item| sugar_for_day << sugar(item[:pollen_id],item[:mass])}
    sugar_per_pollen << sugar_for_day.reduce(:+)
  end
  return @pollen_data[sugar_per_pollen.max.index][:name]
end 

def most_effient
  @harvest_data[efficiency.max.index][:bee_id]
end

def least_effient
  @harvest_data[efficiency.min.index][:bee_id]
end

def popular
  pop_rating = []
  (1..pollen).each do |pollen_id|
    mass_array = []
    look_through_harvest_by_pollen_id = @harvest_data.find {|item| item[:pollen_id] == pollen_id} # => Return an array of Harvest objects with pollen_id
    look_through_harvest_by_pollen_id.each {|item| mass_array << item[:mass]}
    pop_rating << mass_array.reduce(:+)
  end
  return @pollen_data[pop_rating.max.index][:name]  # => Returns name of the Pollen
end

def day
  sugar_per_day = []
  (1..day).each do |day|  
    look_throught_harvest_by_day = @harvest_data.find {|item| item[:day] == day}
    look_throught_harvest_by_day.each {|item| sugar_per_day << sugar(item[:pollen_id], item[:mass])}
  end
end

def worst_day
  @harvest_data.find[day.min.index][:day]
end

def best_day
  @harvest_data[day.max.index][:day]
end

puts "The most sugar was produces from #{data.most_sugar} pollen"
puts "The most efficient bee is #{data.most_efficient}"
puts "The most popular pollen was #{data.popular}"
puts "The least efficient bee is #{data.least_efficient}"
puts "The best day for harvest was #{data.best_day}"
puts "The worst day for harvest was #{data.worst_day}"