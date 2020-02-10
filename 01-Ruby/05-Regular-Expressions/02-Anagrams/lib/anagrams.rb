def normalized_string(string)
  string.gsub(/\W/, "").downcase
end

def anagrams?(a_string, another_string)
  normalized_string(a_string).chars.sort.join == normalized_string(another_string).chars.sort.join
end

def char_frequencies(string)
  normalized_string(string).chars.reduce(Hash.new(0)) do |hash, char|
    hash[char] += 1
    hash
  end
end

def anagrams_on_steroids?(a_string, another_string)
  return false if a_string.length != another_string.length

  a_frequencies = char_frequencies(a_string)
  another_frequencies = char_frequencies(another_string)
  a_frequencies.each_pair do |letter, frequency|
    return false if another_frequencies[letter] != frequency
  end
  true
end

p anagrams_on_steroids?("Monica Lewinsky!", "Nice silky woman")
p anagrams_on_steroids?("aladdin", "aladin")
p anagrams_on_steroids?("aladdin", "alladin")
