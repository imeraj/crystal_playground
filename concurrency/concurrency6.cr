module TimeChannel
  def self.tick(c)
    spawn do
      loop do
        sleep(100.milliseconds)
        c.send(nil)
      end
    end
  end

  def self.after(c)
    spawn do
      sleep(500.milliseconds)
      c.send(nil)
    end
  end
end

tick = Channel(Nil).new
boom = Channel(Nil).new

TimeChannel.tick(tick)
TimeChannel.after(boom)

loop do
  select
  when tick.receive
    puts "tick."
  when boom.receive
    puts "BOOM!"
    break
  else
    puts "    ."
    sleep(50.milliseconds)
  end
end

TimeChannel.after(boom)
