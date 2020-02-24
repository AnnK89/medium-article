class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :media_type
  belongs_to :genre

  def seconds
    (milliseconds.to_f / 1000).round
  end

  def artist
    album.artist
  end
end
