require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Harvest'

describe 'Harvest' do

    it 'should initialize with id' do
      expect(Harvest.new(bee_id: 1)).to be_truthy
    end

  end