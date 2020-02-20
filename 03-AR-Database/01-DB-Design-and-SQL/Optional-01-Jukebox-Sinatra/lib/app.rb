require "sinatra"
require "sinatra/reloader" if development?
require "better_errors"
require "sqlite3"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))

get "/" do
  @artists = DB.execute("SELECT artists.name FROM artists").flatten
  erb :home # Will render views/home.erb file (embedded in layout.erb)
end

get "/artists/:id" do
  query = <<-SQL
  SELECT albums.title
  FROM albums
  JOIN artists ON artists.id = albums.artist_id
  WHERE artists.id = "#{params[:id]}"
  SQL
  @albums = DB.execute(query).flatten
  erb :artists
end

get "/albums/:id" do
  query = <<-SQL
  SELECT tracks.name
  FROM tracks
  JOIN albums ON albums.id = tracks.album_id
  JOIN artists ON artists.id = albums.artist_id
  WHERE albums.id = "#{params[:id]}"
  SQL
  @tracks = DB.execute(query).flatten
  erb :albums
end

get "/tracks/:id" do
  query = <<-SQL
  SELECT tracks.name, tracks.composer, tracks.milliseconds, tracks.bytes, tracks.unit_price
  FROM tracks
  JOIN albums ON albums.id = tracks.album_id
  JOIN artists ON artists.id = albums.artist_id
  WHERE tracks.id = "#{params[:id]}"
  SQL
  @track_info = DB.execute(query).flatten
  erb :tracks
end
