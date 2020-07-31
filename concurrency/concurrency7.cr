class SafeCounter
  property v, mux

  def initialize
    @v = Hash(String, Int32).new
    @mux = Mutex.new
  end

  def inc(key : String)
    mux.lock
    v[key] = v.has_key?(key) ? v[key] + 1 : 1
    mux.unlock
  end

  def value(key : String)
    mux.lock
    v[key]
  ensure
    mux.unlock
  end
end

c = SafeCounter.new
1000.times {
  spawn do
    c.inc("someKey")
  end
}

sleep 1.second
puts c.value("someKey")
