class Product
	def atlaide(a=nil, b=10)
		@c = a - ((a*b)/100)
		return @c.to_f
	end
end

class Animal
	attr_accessor :name
	attr_writer :color
	attr_reader :legs, :arms

	def color
		"The color is #{@color}"
	end

	def legs=(kaaju_skaits)
		@legs ="Kāju skaits ir: #{kaaju_skaits}"
	end
end

#produkts = Product.new

#puts atlaide = Product.new.atlaide(90, 20)

animal1 = Animal.new
animal1.name = "vaardins"
animal1.color = "blue"
animal1.legs = 4

puts animal1.name
puts animal1.color
puts animal1.legs