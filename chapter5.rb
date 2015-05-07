def welcome
	print "hello pasaule!"
end

@word = ["banana", "appleeeeeee", "orange", "pear"]

def longest_word(word = ['aaa', 'bb'])
	
	longest_word = word.inject do |memo, word|
		memo.length > word.length ? memo : word
	end
	return puts longest_word
end

def over_five?
	value = 3
	puts value > 5 ? 'ir' : 'nav'
end

def two_returned_values(a, b)
	c = "summa ir:"
	return [c, a+b]
end

puts two_returned_values(3, 5)
puts "----------"
a, b = two_returned_values(6, 7)
puts "#{a} EUR #{b}"

#longest_word(@word)
#longest_word(@word.map {|a| a.reverse})
#longest_word