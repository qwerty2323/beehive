#!/usr/bin/ruby -wKU
require 'optparse'
require_relative 'calendar'
require_relative 'efficiency'
require_relative 'popularity'
require_relative 'sugarcalculator'
require_relative 'sugarity'

#puts "The most sugar was produces from #{Sugar.new.most_sugar} pollen"

OptionParser.new do |options|
  options.banner = "Usage: beehive.rb [options]"

  options.on("--most_efficient") do
    puts Efficiency.new.most_efficient
  end

  options.on("--least_efficient") do
    puts Efficiency.new.least_efficient
  end

  options.on("--most_popular") do
    puts Popularity.new.most_popular
  end

  options.on("--best_day") do
    puts Calendar.new.best_day
  end
  
  options.on("--worst_day") do
    puts Calendar.new.worst_day
  end

  options.on("--most_sugar") do
    puts Sugarity.new.most_sugar
  end
end.parse!
