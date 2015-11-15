require_relative 'Bee'
require_relative 'Pollen'
require_relative 'Harvest'
require_relative 'Data'

data = Data.new
data.read
 
puts "The most sugar was produces from #{data.most_sugar} pollen"
puts "The most efficient bee is #{data.most_efficient}"
puts "The most popular pollen is #{data.most_popular}"
puts "The least efficient bee is #{data.least_efficient}"
puts "The best day for harvest was #{data.best_day}"
puts "The worst day for harvest was #{data.worst_day}"'

