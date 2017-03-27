puts "It's time to get some exercise and fresh air."
gohome = false
distance = 0
while !gohome
  puts "Do you want to walk or run?"
  answer = gets.chomp.downcase
  if (answer[0,3] == "run")
    distance += 5
    puts "..."
    puts "You are now #{distance}km from home."
  elsif (answer[0,4] == "walk")
    distance += 1
    puts "..."
    puts "You are now #{distance}km from home."
  elsif (answer[0,7] == "go home")
    if (distance == 0)
      puts "You're already home!"
    else
      puts "Ok, time to go home."
      gohome = true
      puts "..."
      puts "Welcome home!"
    end
  else
    puts "You are still #{distance}km from home."
  end
end
