require 'csv'

# file_path = 'lib/movies.csv'

def most_successful(number, max_year, file_path)
  all_movies = load_movies(file_path, max_year)

  # all_movies.sort_by { |movie| -movie[:earnings] }.take(number)
  p all_movies.max_by(number) { |movie| movie[:earnings] }
end

def load_movies(file_path, max_year)
  movies_array = []
  CSV.foreach(file_path) do |row|
    movies_array << { name: row[0], year: row[1].to_i, earnings: row[2].to_i } if row[1].to_i < max_year
  end
  movies_array
end

most_successful(3, 1975, File.dirname(__FILE__) + '/../lib/movies.csv')
