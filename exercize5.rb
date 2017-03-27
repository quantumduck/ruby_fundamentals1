puts "Welcome to PizzaMaker!"
puts "How many pizzas can I get you?"
numpiz = gets.chomp.to_i
if (numpiz <= 0)
  puts "Please consider the fact that pizzas only exist in positive integral quantities."
else
  pizzanum = 1
  numpiz.times do
    suffix = "th"
    if ((pizzanum % 10 == 1) && (pizzanum % 100 != 11))
      suffix = "st"
    elsif ((pizzanum % 10 == 2) && (pizzanum % 100 != 12))
      suffix = "nd"
    elsif ((pizzanum % 10 == 3) && (pizzanum % 100 != 13))
      suffix = "rd"
    end
    puts "How many topping do you want on your #{pizzanum.to_s + suffix} pizza?"
    numtops = gets.chomp.to_i
    if (numtops <= 0)
      puts "You have ordered a pizza with no toppings."
    elsif (numtops == 1)
      puts "You have ordered a pizza with 1 topping."
    else
      puts "You have ordered a pizza with #{numtops} toppings."
    end
    pizzanum += 1
  end
end
