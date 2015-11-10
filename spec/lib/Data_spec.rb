require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Data'
 
describe 'Data' do
  context 'values' do
    it 'should return an array of bee_ids' do
      expect(Data.bee_id).to match_array[1,2,3,4,5]
    end
 
    it 'should return an array of days' do
      expect(Data.day).to match_array[2013-04-01, 2013-04-02, 2013-04-03]
    end
 
    it 'should return an array of pollen_ids' do
      expect(Data.pollen_id).to match_array[1,2,3,4]
    end
 
    it 'should return an array of masses' do
      expect(Data.mass).to match_array[25.9,17.4,33.8]
    end
  end
 
  context 'size' do
 
    it 'mass and bee_id should have equal array size' do
      Data.mass.size.should == Data.bee_id.size
    end
 
    it 'pollen_id and day should have equal array size' do
      Data.pollen_id.size.should == Data.day.size
    end
 
    it 'pollen_id and bee_id should have equal array size' do
      Data.pollen_id.size.should == Data.bee_id.size
    end
  end
end