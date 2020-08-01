SIZE = 10

def fibonacci(n, c)
  x, y = 0, 1
  n.times {
    c.send(x)
    x, y = y, x + y
  }
  c.close
end

c = Channel(Int32).new(SIZE)

spawn do
  fibonacci(SIZE, c)
end

loop do
  if val = c.receive?
    puts val
  else
    break
  end
end
