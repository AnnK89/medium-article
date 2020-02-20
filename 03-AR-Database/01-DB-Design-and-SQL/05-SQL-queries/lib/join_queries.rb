require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<-SQL
  SELECT tracks.name, albums.title, artists.name
  FROM tracks
  JOIN albums ON albums.id = tracks.album_id
  JOIN artists ON artists.id = albums.artist_id
  SQL
  results = db.execute(query)
  return results
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query = <<-SQL
  SELECT COUNT(tracks.genre_id), genres.name, SUM(tracks.milliseconds)
  FROM genres
  JOIN tracks ON tracks.genre_id = genres.id
  WHERE genres.name = "#{genre_name}"
  SQL
  results = db.execute(query).flatten
  average_length = (results[2] / results[0].to_f) / 60_000
  { avg_length: average_length.round(2), category: results[1], number_of_songs: results[0] }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<-SQL
  SELECT artists.name, COUNT(tracks.genre_id) AS c
  FROM genres
  JOIN tracks ON tracks.genre_id = genres.id
  JOIN albums ON albums.id = tracks.album_id
  JOIN artists ON artists.id = albums.artist_id
  WHERE genres.name = "#{genre_name}"
  GROUP BY artists.name
  ORDER BY c DESC
  LIMIT 5
  SQL
  results = db.execute(query)
end
