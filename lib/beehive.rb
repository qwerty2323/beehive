#!/usr/bin/ruby -wKU
require 'optparse'
require_relative 'analysis'
require_relative 'sugar_analysis'
require_relative 'efficiency_analysis'

OptionParser.new do |options|
  options.banner = "Usage: beehive.rb [options]"

  options.on("--most_efficient") do
    EfficiencyAnalysis.new.result :bee, :mass, :max
  end

  options.on("--least_efficient") do
    EfficiencyAnalysis.new.result :bee, :mass, :min
  end

  options.on("--most_popular") do
    Analysis.new.result :pollen_id, :mass, :max
  end

  options.on("--best_day") do
    SugarAnalysis.new.result :day, :mass, :max
  end

  options.on("--worst_day") do
    SugarAnalysis.new.result :day, :mass, :min
  end

  options.on("--most_sugar") do
    SugarAnalysis.new.result :pollen_id, :mass, :max
  end
end.parse!
