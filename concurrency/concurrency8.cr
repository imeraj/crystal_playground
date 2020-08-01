class Counter
  property value

  def initialize(value : Int32)
    @value = value
    @mux = Mutex.new
  end

  def inc
    @mux.lock
    self.value += 1
    @mux.unlock
  end
end

wanted_count = 1000
counter = Counter.new(0)

done_channel = Channel(Nil).new

wanted_count.times do
  spawn do
    counter.inc
    done_channel.send(nil)
  end
end

wanted_count.times do
  done_channel.receive
end

puts counter.value
