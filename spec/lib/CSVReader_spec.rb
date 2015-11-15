require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'CSVReader'
 
describe 'CSVReader' do
  context 'sugar' do
    it 'should calculate sugar' do
      CSVReader.new.read.sugar(2, 22.8).should == 68.4
    end
  end
end