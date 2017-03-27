puts "It's time to get some exercise and fresh air! Tell me where you want to go."
puts "Examples:"
puts "Go North."
puts "walk east"
puts "Run South!"
puts "Go home."
energy = 100
runcost = 20
walkcost = 2
gohome = false
distance = 0.0
distNS = 0.0
distEW = 0.0
delta = 0.0
direction = "North"
while !gohome

  # Get input
  answer = gets.chomp.downcase

  # expect first part of answer to be speed
  if (answer[0,3] == "run")
    delta = 5.0
    answer = answer[4, answer.length]
  elsif (answer[0,4] == "walk")
    delta = 1.0
    answer = answer[5, answer.length]
  elsif (answer[0,2] == "go")
    delta = 1.0
    answer = answer[3, answer.length]
  else
    puts "I didn't understand."
  end

  # expect rest of answer to be a direction or home.
  if (answer != nil)
    if (answer[0,5] == "north")
      direction = "North"
    elsif (answer[0,4] == "east")
      direction = "East"
    elsif (answer[0,5] == "south")
      direction = "South"
    elsif (answer[0,4] == "west")
      direction = "West"
    elsif (answer[0,4] == "home")
      if (distance == 0)
        puts "You're already home!"
        delta = 0.0
      else
        puts "Ok, time to go home."
        gohome = true
        puts "..."
        puts "Welcome home!"
      end
    end
  end

  # update energy
  if (delta == 5.0)
    if (energy > runcost)
      energy -= runcost
    else
      delta = 5.0 * (energy.to_f / runcost.to_f)
      energy = 0
    end
  elsif (delta == 1.0)
    energy -= walkcost
  end
  


  # Calculate the distance using Pythagoras
  if (!gohome)
    if (direction == "North")
      distNS += delta
      distance = ((distNS.abs ** 2.0) + (distEW.abs ** 2.0)) ** 0.5
    elsif (direction == "South")
      distNS -= delta
      distance = ((distNS.abs ** 2.0) + (distEW.abs ** 2.0)) ** 0.5
    elsif (direction == "East")
      distEW += delta
      distance = ((distNS.abs ** 2.0) + (distEW.abs ** 2.0)) ** 0.5
    elsif (direction == "West")
      distEW -= delta
      distance = ((distNS.abs ** 2.0) + (distEW.abs ** 2.0)) ** 0.5
    end


    # Update user on distance
    puts "..."
    puts "You are now #{distance}km from home."
    if (energy <= 0)
      puts "You have collapsed, and are unable to move."
      gohome = true
    elsif (energy <= 25)
      puts "You are getting VERY tired."
    elsif (energy <= 50)
      puts "You are getting tired."
    end
    puts "What next?"
  end
end
