ch = Channel(Int32).new(2)

ch.send(1)
ch.send(2)

puts ch.receive
puts ch.receive
