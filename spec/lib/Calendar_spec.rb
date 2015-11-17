require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Calendar'

describe 'Calendar' do
  context 'initialization' do
    it 'An array should be nil before initialization' do
      expect(sugar_per_day).to be_falsey
    end 

    it 'An array should be true after initialization' do
      Calendar.new
      expect(sugar_per_day).to be_truthy
    end  
  end

end
