class Genre < ActiveRecord::Base
  has_many :tracks
  has_many :albums, -> { distinct }, through: :tracks
  has_many :artists, -> { distinct }, through: :albums
end
