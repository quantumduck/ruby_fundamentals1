puts "Problem 1:"

mealValue = 55.0 # only round dollar amounts  work at this point.
regTip = 0.15
goodTip = 0.2
badTip = 0.1

puts "A good tip would be $#{goodTip * mealValue}0 or $#{mealValue + (goodTip * mealValue)}0 total."

puts
puts "Problem 2:"

puts '"puts 1 + \'one\'" returns error:'
puts "exercize2.rb:13:in `+': String can't be coerced into Integer (TypeError)"
puts "      	from exercize2.rb:13:in `<main>'"

puts '"puts 1.to_s + \'one\'" returns:'
puts 1.to_s + 'one'

puts
puts "Problem 3:"

puts "45628 * 7839 = #{45628 * 7829}."

puts
puts "Problem 4:"

puts "(10 < 20) = true; (30 < 20) = false; (10 == 11 = false.)"
puts "Therefore, ((10 < 20) && (30 < 20)) || !(10 == 11)"
puts "          =(  true    &&   false  ) || !(  false  )"
puts "          =                false    ||     true = true."
puts ""
puts "result:"
puts ((10 < 20) && (30 < 20)) || !(10 == 11)
