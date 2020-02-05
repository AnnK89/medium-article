def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.

  race_array.map! do |horsename|
    "#{race_array.index(horsename) + 1}-#{horsename}!"
  end
  race_array.reverse!
end

# puts horse_racing_format!(["hi", "there"])
# Hello I am a new line of code
