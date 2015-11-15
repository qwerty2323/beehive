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
    (1..@@Bee.count).each do |bee_id|
      @harvest_data.find_all {|item| item[:bee_id] == bee_id}
    end

  end
 
  def sugar(pollen_id, mass)
    
    pollen_row   = @pollen_data.find {|item| item[:pollen_id] == pollen_id}
    sugar_per_mg = row[:sugar_per_mg]
    harvest_row  = @harvest_data.find {|item| item[:mass] == mass}
    mass         = row[:mass]
    return sugar_per_mg * mass 
    
    #for each pollen id get content of sugar from pollens.csv
    #convert mass to sugar for each pollen id from harvest.csv
    #summ up sugar for each pollen id
    #return the max of sugar
  end
 
  def best_day
    #
  end

  def most_effient
    
  end
 
  def least_effient
    
  end
 
  def popular
    
  end
 
  def best_day
    
  end
 
  def worst_day
    
  end
 
  def most_sugar
    
  end

end
