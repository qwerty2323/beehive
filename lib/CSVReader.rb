require 'csv'

class CSVReader

  HARVEST = "../data/harvest.csv"
  POLLEN  = "../data/pollens.csv"

  def initialize
    @harvest_data = []
    @pollen_data  = []
  end

  def read
    CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
      @harvest_data << Harvest.new(bee_id: row["bee_id"], day: row[" day"], pollen_id: row[" pollen_id"], mass: row[" miligrams_harvested"])
    end
    CSV.foreach(POLLEN, headers: true, converters: :all) do |row|
      @pollen_data << Pollen.new(row["pollen_id"], row[" name"], row[" sugar_per_mg"])
    end
  end

  def efficiency
    eff_rating = []
    (1..Bee.count).each do |bee_id| # => Where I can find Bee.count?..
      harvested_sugar = []
      look_throught_harvest_by_bee_id = @harvest_data.find {|item| item[:bee_id] == bee_id}
      look_throught_harvest_by_bee_id.each{|item| harvested_sugar << sugar([:pollen_id], item[:mass])}
      eff_rating << harvested_sugar.reduce(:+)/look_throught_harvest_by_bee_id.count
    end
  end
 
  def sugar(pollen_id, mass)   
    pollen_row   = @pollen_data.find {|item| item[:pollen_id] == pollen_id}
    sugar_per_mg = row[:sugar_per_mg]
    harvest_row  = @harvest_data.find {|item| item[:mass] == mass}
    mass         = row[:mass]
    return sugar_per_mg * mass 
  end
 
  def most_effient
    @harvest_data[efficiency.max.index][:bee_id]
  end
 
  def least_effient
    @harvest_data[efficiency.min.index][:bee_id]
  end
 
  def popular
    pop_rating = []
    (1..Pollen.count).each do |pollen_id|
      mass_array = []
      look_through_harvest_by_pollen_id = @harvest_data.find {|item| item[:pollen_id] == pollen_id} # => Return an array of Harvest objects with pollen_id
      look_through_harvest_by_pollen_id.each {|item| mass_array << item[:mass]}
      pop_rating << mass_array.reduce(:+)
    end
    return @pollen_data[pop_rating.max.index][:name]  # => Returns name of the Pollen
  end
 
  def day
    sugar_per_day = []
    (1..Day.count).each do |day|    # => Where I can find Day.count?..
      look_throught_harvest_by_day = @harvest_data.find {|item| item[:day] == day}
      look_throught_harvest_by_day.each {|item| sugar_per_day << sugar(item[:pollen_id], item[:mass])}
    end
  end
 
  def worst_day
    @harvest_data.find[day.min.index][:day]
  end

  def best_day
    @harvest_data[day.max.index][:day]
  end

end