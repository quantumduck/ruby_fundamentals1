num_range = (1..100)
ret_string = ""

num_range.each do |num|
  ret_string = num.to_s
  if (num % 3 == 0)
    ret_string = "Bit"
    if (num % 5 == 0)
      ret_string += "Maker"
    end
  elsif (num % 5 == 0)
    ret_string = "Maker"
  end
  puts ret_string
end
