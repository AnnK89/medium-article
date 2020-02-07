def array_to_hash(array)
  # TODO: implement the method :)
  hash = {}
  if block_given?
    array.each_with_index do |element, index|
      hash[yield(index).to_s] = element
      p yield(index)
    end
  else
    array.each_with_index { |element, index| hash[index.to_s] = element }
  end
  return hash
end
