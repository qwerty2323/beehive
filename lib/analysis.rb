#!/usr/bin/ruby -wKU
require_relative 'csv_reader'
require_relative 'unique'

class Analysis
# This class gets data tables from csv_reader.rb in order
# to create a rating.
  include Unique
#   Unique is included to get unique values of the |iterator|
  def initialize
    @pollen_data  = CsvReader.pollen
    @table        = CsvReader.harvest
    @rating       = []
  end

  def calculate(search_column, column_name)
    self.unique_values_of(search_column).each do |argument|
      sum_up(column_name, argument, search_column)
    end
    @rating
  end

  def idx(value)
# To find index of maximum value in rating set value to :max
# --//--//--//--// minimum //--//--//--//--//--//--//-- :min
    @rating.index { |x| x == @rating.send(value) }
  end

  def find_in(search_column, argument)
    @table.select { |item| item[search_column] == argument }
  end

  def sum_up(column_name, argument, search_column)
# column_name is :mass. We sum up by mass.
    temp_array = []
    find_in(search_column, argument).each do |item|
      temp_array << item[column_name]
    end
    @rating << temp_array.reduce(:+)
  end

  def result(search_column, column_name, value)
    calculate(search_column, column_name)
    if search_column == :pollen_id && column_name == :mass
      puts "The #{value} popularity gained #{@pollen_data[idx(value)][:name]}"
    end
  end
end
