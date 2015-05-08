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

	@@species = ['cat', 'dog', 'pig', 'horse']
	@@current_animals = []

	def self.species
		@@species
	end

	def self.species=(array=[])
		@@species = array
	end

	def self.current_animals
		@@current_animals
	end

	def self.create_with_attributes(noise, color)
		animal = self.new(noise)
		animal.color = color
		return animal
	end	

	def self.current_animals=(animals)
		@@current_animals = animals
	end

	def initialize(noise, legs=5, arms=3.2)
		@noise = noise
		@legs = legs
		@arms = arms
		@@current_animals << self
	end

	def color
		"The color is #{@color}"
	end

	def color=(color="red")
		@color = color
	end

	def legs=(kaaju_skaits)
		@legs ="Kāju skaits ir: #{kaaju_skaits}"
	end
end

class Cow < Animal
	def color
		"The cow color is #{@color}"
	end
end

#produkts = Product.new

#puts atlaide = Product.new.atlaide(90, 20)

#Animal.species << ["duck", "monkey"]

#puts Animal.species

# animal1 = Animal.new("Buuu", 4)
# animal1.name = "\nvaardins"
# animal1.color = "blue"

# puts animal1.name
# puts animal1.color
# puts animal1.legs
# puts animal1.arms

#puts Animal.current_animals

moisie = Cow.create_with_attributes("muuuu", "red")
puts moisie.color