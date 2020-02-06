def louchebemize_word(word)
  # TODO: implement your louchebem translator
  random_suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"].sample
  return word if word.size == 1

  if ["a", "e", "i", "o", "u"].include? word[0]
    "l#{word}#{random_suffix}"
  else
    first_vowel_index = word.chars.index { |letter| ["a", "e", "i", "o", "u"].include? letter }
    beginning = word[0...first_vowel_index]
    middle = word[first_vowel_index...word.length]
    "l#{middle}#{beginning}#{random_suffix}"
  end
end

def louchebemize(sentence)
  result_elements = []
  words = sentence.split(/\b/)

  words.each do |word|
    if word =~ /\W/
      result_elements << word
    else
      result_elements << louchebemize_word(word)
    end
  end
  result_elements.join
end

# p louchebemize("Hello who are you")
