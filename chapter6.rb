class Product
	def atlaide(a=nil, b=10)
		@c = a - ((a*b)/100)
		return @c.to_f
	end
end

produkts = Product.new

puts atlaide = produkts.atlaide(90, 20)