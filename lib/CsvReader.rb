#!/usr/bin/ruby -wKU
require 'csv'

class CsvReader
  attr_reader :pollen_data, :harvest_data
  # Here I should make top-level documentation comment
  HARVEST = File.expand_path('../../data/harvest.csv', __FILE__)
  POLLEN  = File.expand_path('../../data/pollens.csv', __FILE__)

  def initialize
    @harvest_data ||= []
    @pollen_data  ||= []
    
    CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
      @harvest_data << {bee_id:    row['bee_id'],
                        day:       row[' day'],
                        pollen_id: row[' pollen_id'],
                        mass:      row[' miligrams_harvested'] }
    end
    
    CSV.foreach(POLLEN, headers: true, converters: :all) do |row|
      @pollen_data << {pollen_id:    row['id'],
                       name:         row['name'],
                       sugar_per_mg: row['sugar_per_mg'] }
    end
  end
end
