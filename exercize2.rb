mealValue = 55.0 # only round dollar amounts  work at this point.
regTip = 0.15
goodTip = 0.2
badTip = 0.1

puts "A good tip would be $#{goodTip * mealValue}0 or $#{mealValue + (goodTip * mealValue)}0 total."
