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

	def self.all_species
		['cat', 'dog', 'pig', 'horse']
	end

	def initialize(noise, legs=5, arms=3.2)
		@noise = noise
		@legs = legs
		@arms = arms
	end

	def color
		"The color is #{@color}"
	end

	def legs=(kaaju_skaits)
		@legs ="Kāju skaits ir: #{kaaju_skaits}"
	end
end

#produkts = Product.new

#puts atlaide = Product.new.atlaide(90, 20)

puts Animal.all_species

animal1 = Animal.new("Buuu", 4)
animal1.name = "\nvaardins"
animal1.color = "blue"

puts animal1.name
puts animal1.color
puts animal1.legs
puts animal1.arms