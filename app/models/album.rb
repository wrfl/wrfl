class Album < ActiveRecord::Base
  has_many :album_tracks
  has_many :tracks, through: :album_tracks

  validates :name, presence: true
end
