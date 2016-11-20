#!/usr/bin/env ruby
require './struc/json'
require './struc/node'

json = Json.new


# ARGV[0]
File.open("example/example.txt", "r") do |f|
  @current_node = nil
  count = 0
  f.each_line do |line|
    line_split_data = line.split(" ")
    if line_split_data[0].include? "$"
      @current_node = Node.new line_split_data[1]
      json.addChild @current_node
      count = 0
    else
      if ARGV[2] == "-i"
        @current_node.addKeyValue count, line_split_data[1]
      else
        @current_node.addKeyValue line_split_data[0], line_split_data[1]
      end
      count += 1
    end
  
  end
end

# ARGV[1]
File.open("example/example.json", "w") { |file| file.write json.createJson}