# change stop words text file into an array
def load_stop_words(file)
  File.open(file, "r").reduce([]) do |stop_words, line|
    stop_words << line.chomp
  end
end

def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  counter = Hash.new(0)

  stop_words = load_stop_words(stop_words_file_name)

  File.open(file_name, "r").each_line do |line|
    line.chomp.downcase.split(/\W+/).each do |word|
      counter[word] += 1 unless stop_words.include? word
    end
  end
  Hash[counter.sort_by { |_, v| -v }[0..(number_of_word - 1)]]
end
