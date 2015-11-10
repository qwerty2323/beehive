require 'csv'

class Data
  @@bee_id    = []
  @@day       = []
  @@pollen_id = []
  @@mass      = []
  
  HARVEST = "../data/harvest.csv"

  def self.bee_id
    CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
      @@bee_id << row[0]
    end
  end
 
  def self.day
    CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
      @@day << row[1]
    end
  end
 
  def self.pollen_id
    CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
      @@pollen_id << row[2]
    end
  end
 
  def self.mass
    CSV.foreach(HARVEST, headers: true, converters: :all) do |row|
      @@mass << row[3]
    end
  end

end
