require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Popularity'

describe 'Popularity' do
  context 'initialization' do
    it 'An array should be nil before initialization' do
      expect(pop_rating).to be_falsey
    end 

    it 'An array should be true after initialization' do
      Popularity.new
      expect(pop_rating).to be_truthy
    end  
  end

end
