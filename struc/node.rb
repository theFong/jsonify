class Node 
	@children = []
	@keyValues = []

	@value = ""

	def initialize value
		@children = Array.new
		@keyValues = Array.new
		@value = value
	end

	def getValue
		return @value
	end

	def getChildren
		return @children
	end

	def getKeyValues 
		return @keyValues
	end

	def addChild node
		@children.push node
	end

	def addKeyValue key, value
		@keyValues.push [key,value]
	end

end