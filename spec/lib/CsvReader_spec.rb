require 'simplecov'
SimpleCov.start
require 'spec_helper'
require 'CsvReader'

describe 'CsvReader' do
  context 'read' do
    it 'harvest data should be empty before initialization' do
      run = CsvReader.new
      expect(run.harvest_data).to be_empty
    end

    it 'harvest data should be true after initialization' do
      run = CsvReader.new
      run.read
      expect(run.harvest_data).not_to be_empty
    end
    
    it 'pollen data should be nil before initialization' do
      run = CsvReader.new
      expect(run.pollen_data).to be_empty
    end

    it 'pollen data should be true after initialization' do
      run = CsvReader.new
      run.read
      expect(run.pollen_data).not_to be_empty
    end
  end
end
