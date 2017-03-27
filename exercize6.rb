puts "It's time to get some exercise and fresh air!"
puts "How many energy bars are you bringing?"
numbars = gets.chomp.to_i
puts "Tell me where you want to go."
puts "Examples:"
puts "Go North."
puts "walk east"
puts "Run South!"
puts "Go home."

# SOOO many state variables.
moves = 0
energy = 100
energyboost = 25
runcost = 20
rundistance = 5.0
walkcost = 2
walkdistance = 1.0
gohome = false
distance = 0.0
distNS = 0.0
distEW = 0.0
delta = 1.0
direction = "North"
darkthresh = 15
gruethresh = 20


while !gohome

  # Get input
  answer = gets.chomp.downcase

  # expect first part of answer to be speed
  if (answer[0,3] == "run")
    delta = rundistance
    answer = answer[4, answer.length]
  elsif (answer[0,4] == "walk")
    delta = walkdistance
    answer = answer[5, answer.length]
  elsif (answer[0,2] == "go")
    # delta doesn't change with go, but it is walk by default.
    if (delta == 0)
      delta = 1.0
    end
    answer = answer[3, answer.length]
  elsif (answer[0,3] == "eat")
    if (numbars <= 0)
      puts "You don't have any energy bars to eat."
    else
      puts "You eat an energy bar."
      numbars -= 1
      energy += energyboost
    end
    delta = 0.0
  elsif
    puts "I didn't understand."
    delta = 0.0
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
        steps = distance / delta
        if (delta == rundistance)
          if (steps > (energy.to_f / runcost.to_f))
            distance -= ((energy.to_f) / (runcost.to_f)) * rundistance
            puts "You are now #{distance}km from home."
            puts "You have fallen and can't get up."
          else
            puts "Welcome home!"
          end
        elsif (delta == walkdistance)
          if (steps > (energy.to_f / walkcost.to_f))
            distance -= ((energy.to_f) / (walkcost.to_f)) * walkdistance
            puts "You are now #{distance}km from home."
            puts "You have collapsed, and are unable to move."
          else
            puts "Welcome home!"
          end
        end
      end
    end
  end

  # update energy
  if (delta == rundistance)
    if (energy > runcost)
      energy -= runcost
    else
      delta = rundistance * (energy.to_f / runcost.to_f)
      energy = 0
    end
  elsif (delta == walkdistance)
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
    if (delta > 0.0)
      moves += 1
      puts "..."
    end
    if (distance == 0.0)
      if (moves > 0)
        puts "Welcome home!"
        gohome = 1
      else
        puts "You are still at home."
      end
    else
      puts "You are now #{distance}km from home."
    end

    if (moves < 20)
      if (energy <= 0)
        puts "You have fallen and can't get up."
        gohome = true
      elsif (energy <= 25)
        puts "You are getting VERY tired."
      elsif (energy <= 50)
        puts "You are getting tired."
      end
    end

    if (!gohome)
      if (moves >= 20)
        puts "You have been eaten by a grue."
        gohome = true
      elsif (moves >= 15)
        puts "It's getting dark. You should go home."
        puts "What next?"
      else
        puts "What next?"
      end
    end
  end
end
