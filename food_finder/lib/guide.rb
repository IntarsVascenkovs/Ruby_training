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
			list
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

	def list
		puts "\nListing restaurant\n\n".upcase
		restaurants = Restaurant.saved_restaurants
		restaurants.each do |rest|
			puts rest.name + "\t | \t" + rest.cuisine + "\t | \t" + rest.price
		end
	end

	def add
		puts "\nAdd new restaurant\n\n".upcase
		
		restaurant = Restaurant.build_using_questions

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