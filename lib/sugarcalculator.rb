#!/usr/bin/ruby -wKU
require_relative 'CsvReader'

class SugarCalculator
  attr_reader :mass, :pollen_id
  
  def initialize(args)
    @mass       = args[:mass]
    @pollen_id  = args[:pollen_id]
  end
  
  # Takes 2 arguments _sugar & _pollen_id
  def sugar
    sugar_per_mg * @mass
  end

  def sugar_per_mg
    row = CsvReader.new.pollen_data.find { |item| item[:pollen_id] == @pollen_id }
    row[:sugar_per_mg]
  end
end
