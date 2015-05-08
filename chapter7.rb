require 'chapter7_contact_info.rb'

class Person
	include ContactInfo
end

class Teacher
	include ContactInfo
end

class Student < Person
	#include ContactInfo
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

puts teacher.full_name
puts "------------------"
puts teacher.first_name + " " + teacher.last_name