#!/usr/bin/env ruby
require './struc/json'
require './struc/node'

json = Json.new


# ARGV[0]
File.open(ARGV[0], "r") do |f|
  @current_node = nil
  count = 0
  f.each_line do |line|
  	if line != "" and line != nil and line != "\n"
      line_split_data = line.split(" ")
      if line_split_data[0].include? "$"
        @current_node = Node.new line_split_data[1]
        json.addChild @current_node
        count = 0
      else
        if ARGV[2] == "-i"
          @current_node.addKeyValue count, line_split_data[1...line_split_data.size].join(" ").to_s
        else
          @current_node.addKeyValue line_split_data[0], line_split_data[1...line_split_data.size].join(" ").to_s
        end
        count += 1
      end
    end
  end
end

# ARGV[1]
File.open(ARGV[1], "w") { |file| file.write json.createJson}