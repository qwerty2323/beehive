require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'sugar_calculator'

describe 'SugarCalculator' do

  # context 'Evaluate sugar content' do
  #   it 'should find correct sugar content for given pollen_id' do
  #     calculation = SugarCalculator.new(mass: 22.8, pollen_id: 3)
  #     expect((calculation.sugar_per_mg + 0.0005).to_i).to eq(5)
  #   end
  # end

  context 'calculation' do
    it 'should calculate correctly' do
      calculation = SugarCalculator.new(mass: 22.8, pollen_id: 3)
      expect(calculation.sugar.round(1)).to eq(114)
    end
  end
end
