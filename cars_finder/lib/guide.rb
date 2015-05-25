require 'cars'

class Guide
	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions
			@@actions
		end
	end

	def initialize(path=nil)
		#puts Config.actions
	end

	def list(args="")
		output_action_header("My cars")
	end

	def output_action_header(text)
		puts "#\n{text.upcase.center(60)\n\n}"
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
		args = gets.chomp
		action = args.shift
		return action, args
	end

	def do_action(action, args=[])
		case action
		when 'list'
			list(args)
		when 'quit'
			return :quit
		else
			puts "Wrong command\nUse only #{Config.actions}"
		end
	end
end