#!/usr/bin/ruby -wKU
require 'csv'

class CsvReader
  # Reads both csv's from data folder and returns two arrays of hashes to work with.
  HARVEST ||= File.expand_path('../../data/harvest.csv', __FILE__)
  POLLEN  ||= File.expand_path('../../data/pollens.csv', __FILE__)

  class << self

    def harvest
      unless @harvest
        puts 'Reading harvest.csv'
        @harvest = []
        CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
          @harvest << { bee_id:    row['bee_id'],
                        day:       row[' day'],
                        pollen_id: row[' pollen_id'],
                        mass:      row[' miligrams_harvested'] }
        end
      end
      @harvest ||= self
    end

    def pollen
      unless @pollen
        puts 'Reading pollens.csv'
        @pollen = []
        CSV.foreach(POLLEN, headers: true, converters: :all) do |row|
          @pollen << { pollen_id:    row['id'],
                       name:         row['name'],
                       sugar_per_mg: row['sugar_per_mg'] }
        end
      end
      @pollen ||= self
    end
  end
end
