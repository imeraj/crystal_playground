def say(s)
  5.times do
    sleep 1.second
    puts s
  end
end

spawn do
  say("world")
end

say("hello")
