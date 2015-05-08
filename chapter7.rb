module ContactInfo
	attr_accessor :first_name, :last_name, :city, :state, :zip_code

	def full_name
		return @first_name + " " + @last_name
	end

	def city_state_zip
		csz = @city
		csz += ", #{state}" if @state
		csz += ", #{zip_code}" if @zip_code
		return csz
	end
end

class Person
	include ContactInfo
end

class Teacher
	include ContactInfo
end

class Student
	include ContactInfo
end

person = Person.new
person.first_name = "John"

student = Student.new
student.last_name = "Smith"

teacher = Teacher.new
teacher.first_name = "k123"
teacher.last_name = "Robo"

puts person.first_name
puts student.last_name
puts teacher.first_name + " " + teacher.last_name