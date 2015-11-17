require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Counter'

describe 'Counter' do
  context 'initialization' do
    it 'Day array should be nil before initialization' do
      expect(day_array).to be_falsey
    end 

    it 'Day array should be true after initialization' do
      Counter.new
      expect(day_array).to be_truthy
    end  

    it 'Bee array should be nil before initialization' do
      expect(bee_array).to be_falsey
    end 

    it 'Bee array should be true after initialization' do
      Counter.new
      expect(bee_array).to be_truthy
    end

    it 'Pollen array should be nil before initialization' do
      expect(pollen_array).to be_falsey
    end 

    it 'Pollen array should be true after initialization' do
      Counter.new
      expect(pollen_array).to be_truthy
    end      
  end

end
