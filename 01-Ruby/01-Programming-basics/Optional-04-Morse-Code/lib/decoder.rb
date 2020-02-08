def decode(morse_text)
  # TODO: Decode the morse text you just got!
  morse_text.downcase.split("|").map { |morse_word| decode_word(morse_word) }.join(" ")
end

def decode_word(morse_word)
  morse_word.split(" ").map { |morse_letter| MORSE_CODE.key(morse_letter) }.join.upcase
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



p decode(".... ..|--. ..- -.-- ...")
