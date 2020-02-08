def visa?(card)
  # TODO: A visa card starts with a 4
  card.delete(" ").start_with? "4"
end

def mastercard?(card)
  # TODO: A mastercard card starts with a 5
  card.delete(" ").start_with? "5"
end

def valid_card?(card)
  # TODO: Implement the validator. Return true if the card is valid, false otherwise.
  sum = 0
  digits = card.delete(" ").split("").map { |digit| digit.to_i } # an array of integers
  return false if digits.empty?

  digits.each_with_index do |digit, index|
    if index.even?
      sum += digit * 2 >= 10 ? (digit * 2) - 9 : digit * 2
    else
      sum += digit
    end
  end
  (sum % 10).zero?
end
