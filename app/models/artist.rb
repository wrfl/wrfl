class Artist < ActiveRecord::Base
  has_many :tracks
  has_many :albums

  validates :artist_name, presence: true
end
