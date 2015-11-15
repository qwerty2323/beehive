require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Bee'

describe 'Bee' do
    it 'should initialize with id' do
      expect(Bee.new(id: 1)).to be_truthy
    end

    it 'should return 1 for the count number of Bees, when created 1 bee' do
      @@count = 0
      Bee.new(id: 2)
      expect(Bee.count).to eq(1)
    end

    it 'should return 2 for the count number of Bees, when created 2 bees' do
      @@count = 0
      Bee.new(id: 1)
      Bee.new(id: 2)
      expect(Bee.count).to eq(2)
    end

    it 'should return 99 for the count number of Bees, when created 99 bees' do
      @@count = 0
      99.times do |n|
        Bee.new(id: n)
      end
      expect(Bee.count).to eq(99)
    end
  end