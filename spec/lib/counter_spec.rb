require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'counter'

describe 'Counter' do
  context 'initialization' do
    it 'Day array should be true after initialization' do
      expect(Counter.new.day_array).not_to be_empty
    end

    it 'Bee array should be true after initialization' do
      Counter.new
      expect(Counter.new.bee_array).not_to be_empty
    end

    it 'Pollen array should be true after initialization' do
      expect(Counter.new.pollen_array).not_to be_empty
    end
  end
end
