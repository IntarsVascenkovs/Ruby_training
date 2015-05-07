def welcome
	print "hello pasaule!"
end

@word = ["banana", "appleeeeeee", "orange", "pear"]

def longest_word(word)
	
	longest_word = word.inject do |memo, word|
		memo.length > word.length ? memo : word
	end
	puts longest_word
end

def over_five?
	value = 3
	puts value > 5 ? 'ir' : 'nav'
end

longest_word(@word)
longest_word(@word.map {|a| a.reverse})