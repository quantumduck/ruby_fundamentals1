num_range = (1..100)

num_range.each do |num|
  if (num % 3 == 0)
    if (num % 5 == 0)
      puts "BitMaker"
    else
      puts "Bit"
    end
  elsif (num % 5 == 0)
    puts "Maker"
  else
    puts num
  end
end
