require_relative 'CsvReader'
module Counter
  # Here I should make top-level documentation comment
  # @harvest_data & @pollen_data are not initilized!!!
  def day
    @harvest_data.each { |item| day_array << item[:day] }
    day_array.uniq.length
  end

  def bee
    @harvest_data.each { |item| bee_array << item[:bee_id] }
    bee_array.uniq.length
  end

  def pollen
    @harvest_data.each { |item| pollen_array << item[:pollen_id] }
    pollen_array.uniq.length
  end
end
