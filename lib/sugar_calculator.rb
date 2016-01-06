#!/usr/bin/ruby -wKU
require_relative 'csv_reader'

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

  private
  
  def sugar_per_mg
    row = CsvReader.pollen.find do |item|
      item[:pollen_id] == @pollen_id
    end
    row[:sugar_per_mg]
  end
end
