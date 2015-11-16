module Counter
  def day
    CSVReader.new.read
    day_array = []
    @harvest_data.each {|item| day_array << item[:day]}
    return day_array.uniq.length
  end

  def bee
  	CSVReader.new.read
    bee_array = []
    @harvest_data.each {|item| bee_array << item[:bee_id]}
    return bee_array.uniq.length
  end

  def pollen
  	CSVReader.new.read
    pollen_array = []
    @harvest_data.each {|item| pollen_array << item[:pollen_id]}
    return pollen_array.uniq.length
  end
end