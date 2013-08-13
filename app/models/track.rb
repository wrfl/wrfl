class Track < ActiveRecord::Base
  has_many :plays
  has_many :album_tracks
  has_one :album, through: :album_tracks
  belongs_to :artist
end
