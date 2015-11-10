require 'csv'

class Data
	attr_accessor :bee_id, :day, :pollen_id, :mass, :name, :sugar_per_mg

	harvest_args = {}
	pollen_args = {}

	def self.get
		CSV.foreach(HARVEST, header: true, converters: :all) do |row|
			harvest_args[:bee_id] 	 = row[0]
			harvest_args[:day] 			 = row[1]
			harvest_args[:pollen_id] = row[2]
			harvest_args[:mass] 		 = row[3]
		end

		CSV.foreach(POLLEN, header: true, converters: :all) do |row|
			pollen_args[:pollen_id] 	 = row[0]
			pollen_args[:name]      	 = row[1]
			pollen_args[:sugar_per_mg] = row[2]
		end
	end

end
