require_relative 'csv_reader'
module Unique
  # Here will be documentation comment
  def unique_values_of(name)
    @@array ||= [] 

    CsvReader.harvest.each do |item|
      @@array    << item[name]
    end
    @@array.uniq!
  end
end

