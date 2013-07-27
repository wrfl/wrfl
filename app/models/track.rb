class Track < ActiveRecord::Base
  has_many :album_tracks
  has_one :album, through: :album_tracks
  belongs_to :artist
  
  scope :by_artist, ->(artist) { where(:id => artist.id)}
end
