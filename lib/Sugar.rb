module Sugar
  include Counter
  def sugar(pollen_id, mass)
    CSVReader.new.read  
    pollen_row   = @pollen_data.find {|item| item[:pollen_id] == pollen_id}
    sugar_per_mg = pollen_row[:sugar_per_mg]
    harvest_row  = @harvest_data.find {|item| item[:mass] == mass}
    mass         = harvest_row[:mass]
    return sugar_per_mg * mass
  end
   
  def most_sugar
    CSVReader.new.read
    sugar_per_pollen = []
    (1..Counter::pollen).each do |pollen_id|
      sugar_for_day = []
      look_through_harvest_by_pollen_id.each {|item| sugar_for_day << sugar(item[:pollen_id],item[:mass])}
      sugar_per_pollen << sugar_for_day.reduce(:+)
    end
    return @pollen_data[sugar_per_pollen.max.index][:name]
  end
end
