def sum(s, c)
  sum = s.sum(0)
  c.send(sum)
end

s = [7, 2, 8, -9, 4, 0]
mid = (s.size / 2).to_i

c = Channel(Int32).new

spawn do
  sum(s[...mid], c)
end

spawn do
  sum(s[mid...], c)
end

x, y = c.receive, c.receive

puts x, y, x + y
