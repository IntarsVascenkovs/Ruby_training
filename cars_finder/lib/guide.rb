require 'cars'
require 'support/string_extend'

class Guide
	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions
			@@actions
		end
	end

	def initialize(path=nil)
		Cars.filepath = path
		if Cars.file_usable?
			puts "Found cars file!"
		elsif 
			Cars.create_file
			puts "Created cars file"
		else
			puts "Exiting.\n\n"
			exit!
		end
	end

	def launch!
		result = nil
		until result == :quit
			action, args = get_action
			result = do_action(action, args)
		end
	end

	def get_action
		action = nil
		print '> '
		args = gets.chomp.downcase.strip.split(' ')
		action = args.shift
		return action, args
	end

	def do_action(action, args=[])
		case action
		when 'list'
			list(args)
		when 'add'
			add
		when 'quit'
			return :quit
		else
			puts "Wrong command\nUse only #{Config.actions}"
		end
	end

	def list(args="")
		output_action_header("My cars")
		
		cars = Cars.saved_cars
		output_cars_table(cars)

		output_action_footer("Result for list")
	end

	def add
		output_action_header("Added new restaurant")

		cars = Cars.build_using_questions

		if cars.save
			puts "\nCar added\n\n"
		else
			puts "\nSave error: Car not added!\n\n"
		end
	end

	def output_action_header(text)
		puts "\n#{text.upcase.center(60)}\n\n"
	end

	def output_cars_table(cars=[])
		print " " + "Name".ljust(30)
		print " " + "Type".ljust(20)
		print " " + "Price".rjust(6) + "\n"
		puts "-" * 60

		cars.each do |car|
			line = " " << car.name.titleize.ljust(30)
			line << " " + car.type.titleize.ljust(20)
			#line << " " + car.formatted_price.rjust(6)
			line << " " + car.price.rjust(6)
			puts line
		end

		puts "No listings found" if cars.empty?
		puts "-" * 60
	end

	def output_action_footer(text)
		puts "\n#{text.center(60)}\n\n"
	end
end