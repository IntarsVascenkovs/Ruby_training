#a = [*1..10].delete_if{|i| i %3 ==0}
#puts a

h1 = {"a"=>111, "b"=>222}
h2 = {"b"=>333, "c"=>444}
puts h1.merge(h2) {|key, old, new| old + new + 111}

hash = {"a"=>111, "b"=>222}
puts hash.map {|k,v| "atslegas #{k} vertiba ir #{v}"}