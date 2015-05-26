class Cars

	@@filepath = nil
	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end

	def self.file_exists?
		if @@filepath && File.exists?(@@filepath)
			return true
		else
			return false
		end
	end

	def self.file_usable?
		#return false unless @@filepath
		#return false unless File.exists?(@@filepath)
		#return false unless File.readable?(@@filepath)
		#return false unless File.writable?(@@filepath)
		return true
	end

	def self.create_file
		File.open(@@filepath, 'w') unless file_exists?
		return file_usable?
	end

	def self.saved_cars
		cars = []
		if file_usable?
			file = File.new(@@filepath, 'r')
			file.each_line do |line|
				cars << Cars.new.import_line(line.chomp)
			end
			return cars
		end
	end

	def initialize(args={})
		@name  = args[:name]  || ""
		@type  = args[:type]  || ""
		@price = args[:price] || ""
	end

	def import_line(line)
		line_array = line.split("\t")
		@name, @type, @price = line_array
		return self
	end
end