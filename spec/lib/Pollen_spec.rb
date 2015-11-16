require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Pollen'

describe 'Pollen' do
    it 'should initialize with id' do
      expect(Pollen.new(pollen_id: 1)).to be_truthy
    end

  end