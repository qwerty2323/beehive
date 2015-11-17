require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'Sugar'

describe 'Sugar' do
  context 'initialization' do
    it 'An array should be nil before initialization' do
      expect(sugar_per_pollen).to be_falsey
    end 

    it 'An array should be true after initialization' do
      Sugar.new
      expect(sugar_per_pollen).to be_truthy
    end  
  end

  context 'calculation' do
    it 'should calculate correctly' do
      Sugar.new
      expect(sugar(3, 22.8)).to eq(68.4)
    end

    it 'should get max sugar' do
      #
    end

end

