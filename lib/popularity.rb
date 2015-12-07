#!/usr/bin/ruby -wKU
require_relative 'CsvReader'
require_relative 'counter'

class Popularity
  attr_reader :pop_rating, :pollen_data
  # Here I should make top-level documentation comment
  def initialize
    @pollen_data = CsvReader.new.pollen_data
    @table       = CsvReader.new.harvest_data
    @pop_rating  = []
  end

  def popular
    Counter.new.pollen.each do |pollen_id|
      harvested_mass(pollen_id)
    end
    @pop_rating
  end

  def most_popular
    popular
    @pollen_data[pop_idx][:name]
  end

  def pop_idx
    @pop_rating.index { |x| x == @pop_rating.max }
  end
  
  def by(pollen_id)
    @table.select { |item| item[:pollen_id] == pollen_id }
  end

  def harvested_mass(pollen_id)
    mass_array = []
    by(pollen_id).each do |item|
      mass_array << item[:mass]
    end
    @pop_rating << mass_array.reduce(:+)
  end

end
