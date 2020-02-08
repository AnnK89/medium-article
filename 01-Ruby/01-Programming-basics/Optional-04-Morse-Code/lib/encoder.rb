def encode(text)
  # TODO: write a method which returns the morse sentence for the given text
  # NOTE: you may want to extract a `encode_word` method
  words = text.downcase.gsub(/[,.!?']/, "").split(" ")
  words.map { |word| encode_word(word) }.join("|")
end

def encode_word(word)
  word.chars.map { |alphabet| MORSE_CODE[alphabet] }.join(" ")
end


MORSE_CODE = {
  "a" => ".-",
  "b" => "-...",
  "c" => "-.-.",
  "d" => "-..",
  "e" => ".",
  "f" => "..-.",
  "g" => "--.",
  "h" => "....",
  "i" => "..",
  "j" => ".---",
  "k" => "-.-",
  "l" => ".-..",
  "m" => "--",
  "n" => "-.",
  "o" => "---",
  "p" => ".--.",
  "q" => "--.-",
  "r" => ".-.",
  "s" => "...",
  "t" => "-",
  "u" => "..-",
  "v" => "...-",
  "w" => ".--",
  "x" => "-..-",
  "y" => "-.--",
  "z" => "--.."
}




# p encode("Hey Jude, don't make it bad")
