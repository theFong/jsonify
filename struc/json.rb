require './struc/node'

class Json
	@jsonText

	@children
	@numTabs

	def initialize
		@children = Array.new
		@jsonText = "{\n"
		@numTabs = 0
	end

	def getJSONStr str
		return "\"#{str}\""
	end

	def addChild child
		@children.push(child)
	end

	def createJson
		childCount = 0
		@children.each do |child|
			@numTabs += 1
			@jsonText += getTabs(@numTabs) + getJSONStr(child.getValue) + ": {\n"
			@numTabs += 1
			index = 0
			child.getKeyValues.each do |kv|
				@jsonText += "#{getTabs(@numTabs)} #{getJSONStr(kv[0])} : #{getJSONStr(kv[1])}#{(index == child.getKeyValues.size-1 ? "\n" : ",\n")}"
				index += 1
			end
			@numTabs -= 1
			childCount += 1
			@jsonText += getTabs(@numTabs) + "}#{childCount < @children.size ? "," : ""}\n"
			@numTabs -= 1
		end
		@jsonText += getTabs(@numTabs) + "}\n"
		return @jsonText
	end

	def getTabs numOfTabs
		tabs = ""
		for i in 0...numOfTabs
			tabs += "\t"
		end
		return tabs
	end


end