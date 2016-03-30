require_relative 'csv_reader'
module Unique
  # Here will be documentation comment
  def unique_values_of(name)
    @@array ||= CsvReader.harvest.uniq { |item| item[name] }
  end
end

