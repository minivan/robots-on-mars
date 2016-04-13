#!/usr/bin/env ruby
require_relative '../lib/mission'

input = ""

if ARGV.length > 0
  input = ARGF.read
else
  input = File.read("./sample/input")
end

puts "Computing Mars Mission using input:"
puts input
puts "="*30
puts "Result:"
puts Mission.new(input).simulate
