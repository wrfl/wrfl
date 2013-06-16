class Play < ActiveRecord::Base
  belongs_to :album
  belongs_to :track
  belongs_to :user
end
