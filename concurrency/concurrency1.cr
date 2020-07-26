def say(s)
  (1..5).each do
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
