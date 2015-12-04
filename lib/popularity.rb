#!/usr/bin/ruby -wKU
require_relative 'CsvReader'
require_relative 'counter'

class Popularity
  # Here I should make top-level documentation comment
  def initialize
    CsvReader.new.read
    pop_rating = []
  end

  def popular # Has to many lines!!
    (1..Counter.new.pollen).each do |pollen_id|
      mass_array = []
      look_through_harvest_by_pollen_id = @harvest_data.select do |item|
        item[:pollen_id] == pollen_id
      end
      look_through_harvest_by_pollen_id.each do |item|
        mass_array << item[:mass]
      end
      pop_rating << mass_array.reduce(:+)
    end
    @pollen_data[pop_rating.max.index][:name]  # => Returns name of the Pollen
  end
end
