module Efficiency
  include Counter
  def efficiency
    CSVReader.new.read
    eff_rating = []
    (1..Counter::bee).each do |bee_id|
      harvested_sugar = []
      look_throught_harvest_by_bee_id = @harvest_data.select {|item| item[:bee_id] == bee_id}
      look_throught_harvest_by_bee_id.each{|item| harvested_sugar << sugar([:pollen_id], item[:mass])}
      eff_rating << harvested_sugar.reduce(:+)/look_throught_harvest_by_bee_id.count
    end
  end
   
  def most_effient
    @harvest_data[efficiency.max.index][:bee_id]
  end
   
  def least_effient
    @harvest_data[efficiency.min.index][:bee_id]
  end
end