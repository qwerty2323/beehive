require_relative 'CsvReader'
class Counter
  attr_reader :day_array, :bee_array, :pollen_array
  # Here I should make top-level documentation comment
  def initialize
    @day_array ||= []
    @bee_array ||= []
    @pollen_array ||= []
    
    CsvReader.new.harvest_data.each do |item|
      day_array    << item[:day]
      bee_array    << item[:bee_id]
      pollen_array << item[:pollen_id]
    end
  end

  def day
    day_array.uniq
  end

  def bee
    bee_array.uniq
  end

  def pollen
    pollen_array.uniq
  end
end
