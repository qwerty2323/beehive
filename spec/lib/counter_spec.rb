require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'counter'

describe 'Counter' do
  context 'initialization' do
    it 'Day array should be nil before initialization' do
      expect(Counter.new.day_array).to be_falsey
    end

    it 'Day array should be true after initialization' do
      Counter.new
      expect(Counter.new.day_array).to be_truthy
    end

    it 'Bee array should be nil before initialization' do
      expect(Counter.new.bee_array).to be_falsey
    end

    it 'Bee array should be true after initialization' do
      Counter.new
      expect(Counter.new.bee_array).to be_truthy
    end

    it 'Pollen array should be nil before initialization' do
      expect(Counter.new.pollen_array).to be_falsey
    end

    it 'Pollen array should be true after initialization' do
      Counter.new
      expect(Counter.new.pollen_array).to be_truthy
    end
  end
end
