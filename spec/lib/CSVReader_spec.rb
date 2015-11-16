require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'CSVReader'
 
describe 'CSVReader' do
  context 'read' do
    it 'harvest data should be nil before initialization' do
      expect(@harvest_data).to be_falsey
    end

	it 'harvest data should be true after initialization' do
      CSVReader.new.read
      expect(@harvest_data).to be_truthy
    end
    
    it 'pollen data should be nil before initialization' do
      expect(@pollen_data).to be_falsey
    end

	it 'pollen data should be true after initialization' do
      CSVReader.new.read
      expect(@pollen_data).to be_truthy
    end    
  end
end