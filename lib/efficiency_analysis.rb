#!/usr/bin/ruby -wKU
require_relative 'sugar_analysis'

class EfficiencyAnalysis < SugarAnalysis
  def average(search_column, argument)
    find_in(search_column, argument).size
  end

  def sum_up(column_name, argument, search_column)
  # column_name is :mass. We sum up by mass.
    temp_array = []
    find_in(search_column, argument).each do |item|
      temp_array << SugarCalculator.new(mass: item[column_name], pollen_id: item[:pollen_id]).sugar / average(search_column, argument)
    end
    @rating << temp_array.reduce(:+)
  end

  def result(search_column, column_name, value)
    if iterator && search_column == :bee_id && column_name == :mass
      puts "ID of bee with #{value} efficiency was #{self.unique_values_of(iterator)[idx(value)]}"
    end
  end
end
# :bee_id, :mass
