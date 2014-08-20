class Artist < ActiveRecord::Base
  has_many :tracks
  has_many :albums

  validates :name, presence: true

  def to_s
    name
  end
end
