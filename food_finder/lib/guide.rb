require 'restaurant'

class Guide
	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions; @@actions; end
	end


	def initialize(path=nil)
		Restaurant.filepath = path
		if Restaurant.file_usable?
			puts "Found restaurant file!"
		elsif Restaurant.create_file
			puts "Created restaurant file!"
		else
			puts "Exiting.\n\n"
			exit!
		end
	end

	def launch!
		introduction

		result = nil

		until result == :quit
			action = get_action
			result = do_action(action)
		end

		conclusion
	end

	def get_action
		action = nil
		until Guide::Config.actions.include?(action)
			puts "Actions: " + Guide::Config.actions.join(", ") if action
			print "> "
			#user_response = gets.chomp
			action = gets.chomp.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
		when 'list'
			puts 'listing'
		when 'find'
			puts 'finding'
		when 'add'
			add
		when 'quit'
			return :quit 
		else
			puts"wrong command!"
		end
	end

	def add
		puts "\nAdd new restaurant\n\n".upcase
		restaurant = Restaurant.new
		print "Restaurant name: "
		restaurant.name = gets.chomp.strip

		print "Cuisine type: "
		restaurant.cuisine = gets.chomp.strip

		print "Average price: "
		restaurant.price = gets.chomp.strip

		if restaurant.save
			puts "\nRestaurant added\n\n"
		else
			puts "\nSave error: Restaurant not added\n\n"
		end
	end

	def introduction
		puts "\n\n<<< Welcome to the Food finder >>>\n\n"
	end

	def conclusion
		puts "\n<<< Bon Apetit >>>\n\n\n"
	end
end