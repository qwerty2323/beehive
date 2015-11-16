require_relative 'CSVReader'
require_relative 'Counter'

class Popularity

  def initialize
    CSVReader.new.read
    pop_rating = []
  end

  def popular
    (1..Counter.new.pollen).each do |pollen_id|
      mass_array = []
      look_through_harvest_by_pollen_id = @harvest_data.select {|item| item[:pollen_id] == pollen_id}
      look_through_harvest_by_pollen_id.each {|item| mass_array << item[:mass]}
      pop_rating << mass_array.reduce(:+)
    end
    return @pollen_data[pop_rating.max.index][:name]  # => Returns name of the Pollen
  end
end
