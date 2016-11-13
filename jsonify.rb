#!/usr/bin/env ruby

def getJSONStr str
	return "\"#{str}\""
end


jsonText = "{\n\t"
File.open(ARGV[0], "r") do |f|
	jsonText+=getJSONStr f.readline.chomp
	jsonText += ": {\n"
	count = 0
	f.each_line do |line|
		if ARGV[2] != "-i"
			data = line.split(" ")
			if f.eof?
				jsonText+="\t\t#{getJSONStr count}:#{getJSONStr data[1..data.size].join(" ")}\n"
			else
				jsonText+="\t\t#{getJSONStr count}:#{getJSONStr data[1..data.size].join(" ")},\n"
			end
			
		else
			if f.eof?
				jsonText += "\t\t#{getJSONStr count}:#{getJSONStr line}\n"
			else
				jsonText += "\t\t#{getJSONStr count}:#{getJSONStr line},\n"
			end
		end
		count +=1
	end
end

jsonText+= "\t}\n}"

File.open(ARGV[1], "w") { |file| file.write jsonText}



