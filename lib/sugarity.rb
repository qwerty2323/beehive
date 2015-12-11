#!/usr/bin/ruby -wKU
require_relative 'CsvReader'
require_relative 'counter'
require_relative 'sugarcalculator'

class Sugarity
  attr_reader :sugar_rating, :pollen_data
  # Here I should make top-level documentation comment
  def initialize
    @pollen_data  = CsvReader.new.pollen_data
    @table        = CsvReader.new.harvest_data
    @sugar_rating = []
    @pollen       = Counter.new.pollen
  end

  def sugarize
    @pollen.each do |pollen_id|
      harvested_sugar(pollen_id)
    end
    @sugar_rating
  end
 
  def most_sugar
    sugarize
    puts "The most sugar was produced from #{@pollen_data[sug_idx][:name]}"
  end

  def sug_idx
    @sugar_rating.index { |x| x == @sugar_rating.max }
  end
  
  def by(pollen_id)
    @table.select { |item| item[:pollen_id] == pollen_id }
  end

  def harvested_sugar(pollen_id)
    sugar_array = []
    by(pollen_id).each do |item|
      sugar_array << SugarCalculator.new(mass: item[:mass], pollen_id: pollen_id).sugar
    end
    @sugar_rating << sugar_array.reduce(:+)
  end
end
