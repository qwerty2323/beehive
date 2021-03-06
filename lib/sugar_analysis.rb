#!/usr/bin/ruby -wKU
require_relative 'analysis'
require_relative 'unique'
require_relative 'sugar_calculator'

class SugarAnalysis < Analysis
# The obvious distinctions between SugarAnalysis and Analysis is that
# we calculate sugar on the way to create rating
# To find out which pollen produced most of sugar :pollen_id, :mass, :max
# To find out which day was the best for harvest :day, :mass, :max
  def sum_up(column_name, argument, search_column)
  # column_name is :mass. We sum up by mass.
    temp_array = []
    find_in(search_column, argument).each do |item|
      temp_array << SugarCalculator.new(mass: item[column_name], pollen_id: item[:pollen_id]).sugar
    end
    @rating << temp_array.reduce(:+)
  end

  def result(search_column, column_name, value)
    calculate(search_column, column_name)
    if search_column == :pollen_id && column_name == :mass
      puts "The #{value} amount of sugar was produced from #{@pollen_data[idx(value)][:name]}"
    elsif search_column == :day && column_name == :mass
      puts "The #{value} amount of sugar was harvested on #{self.unique_values_of(iterator)[idx(value)]}"
    end
  end
end
