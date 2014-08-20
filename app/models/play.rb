class Play < ActiveRecord::Base
  belongs_to :album
  belongs_to :track
  belongs_to :user

  validates :album, presence: true
  validates :track, presence: true

  def to_s
    "#{track} on #{album} played by #{user}"
  end
end
