SIZE = 10

def fibonacci(c, quit)
  x, y = 0, 1

  loop do
    select
    when c.send(x)
      x, y = y, x + y
    when quit.receive
      puts "quit"
      return
    end
  end
end

c = Channel(Int32).new
quit = Channel(Int32).new

spawn do
  SIZE.times {
    puts c.receive
  }
  quit.send(0)
end

fibonacci(c, quit)
