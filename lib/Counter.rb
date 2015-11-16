require_relative 'CSVReader'
class Counter
  def initialize
    CSVReader.new.read
    day_array    = []
    bee_array    = []
    pollen_array = []
  end

  def day
    @harvest_data.each {|item| day_array << item[:day]}
    return day_array.uniq.length
  end

  def bee
    @harvest_data.each {|item| bee_array << item[:bee_id]}
    return bee_array.uniq.length
  end

  def pollen
    @harvest_data.each {|item| pollen_array << item[:pollen_id]}
    return pollen_array.uniq.length
  end
end