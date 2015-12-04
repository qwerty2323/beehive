require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'popularity'

describe 'Popularity' do
  context 'initialization' do
    it 'An array should not be empty after initialization' do
      expect(Popularity.new.pop_rating).to be_empty
    end

    it 'An array should be true after initialization' do
      a = Popularity.new.popular
      expect(a.pop_rating).not_to be_empty
    end
  end
end
