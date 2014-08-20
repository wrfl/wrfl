class Track < ActiveRecord::Base
  belongs_to :artist

  has_many :plays
  has_many :album_tracks

  validates :artist, presence: true
  validates :name, presence: true

  def to_s
    "#{name} by #{artist}"
  end
end
