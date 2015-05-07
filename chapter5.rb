def welcome
	puts "hello pasaule!"
end

def longest_word
	word = ["banana", "apple", "orange", "pear"]
	longest_word = word.inject do |memo, word|
		memo.length > word.length ? memo : word
	end
	puts longest_word
end

def over_five?
	value = 3
	puts value > 5 ? 'ir' : 'nav'
end