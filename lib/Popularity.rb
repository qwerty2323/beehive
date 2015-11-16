module Popularity
  include Counter
  def popular
    CSVReader.new.read
    pop_rating = []
    (1..Counter::pollen).each do |pollen_id|
      mass_array = []
      look_through_harvest_by_pollen_id = @harvest_data.select {|item| item[:pollen_id] == pollen_id}
      look_through_harvest_by_pollen_id.each {|item| mass_array << item[:mass]}
      pop_rating << mass_array.reduce(:+)
    end
    return @pollen_data[pop_rating.max.index][:name]  # => Returns name of the Pollen
  end
end
