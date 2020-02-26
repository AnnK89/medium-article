def beer_song(beer_start_count)
  # TODO: sing the song
  i = beer_start_count
  while i > 0
    print_remaining_bottle(i)
    i -= 1
  end
end

def print_remaining_bottle(number)
  # if number > 1
  puts "#{bottles(number)} of beer on the wall, #{bottles(number)} of beer!"
  # else
  #   puts "#{bottles(number)} of beer on the wall, #{bottles(number)} of beer!"
  # end
  puts "Take one down, pass it around, #{bottles(number - 1)} of beer on the wall!"
end

def bottles(number)
  if number > 1
    "#{number} bottles"
  elsif number == 1
    "1 bottle"
  else
    "no more bottles"
  end
end

# p beer_song(ARGV[0].to_i)
