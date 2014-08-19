class Track < ActiveRecord::Base
  belongs_to :artist

  has_many :plays
  has_many :album_tracks

  has_one :album, through: :album_tracks

  validates :artist, presence: true
end
