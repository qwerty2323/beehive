require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'efficiency'
require 'CsvReader'
require 'counter'
require 'sugarcalculator'

describe 'efficiency' do
  context 'initialize' do
    it 'efficiency rating should not be empty after initialization' do
      expect(Efficiency.new.eff_rating).to be_empty
    end
  end

  context 'by' do
    it 'should return examples of given bee id' do
      table = Efficiency.new.by(1)
      table.each do |hash|
        expect(hash[:bee_id]).to eq(1)
      end
    end
  end

  context 'workdays' do
    it 'should return number of days, when bee went to harvest' do
      expect(Efficiency.new.workdays(1)).to eq(69)
    end
  end
end
