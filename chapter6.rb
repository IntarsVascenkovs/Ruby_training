class Product
	def atlaide(a=45, b=10)
		c = a - ((a*b)/100)
		return c
	end
end

produkts = Product.new

atlaide = produkts.atlaide

puts atlaide