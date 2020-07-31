def say(s)
  5.times do
    sleep 1.second
    puts s
  end
end

spawn do
  loop do
    say("world")
  end
end

say("hello")
