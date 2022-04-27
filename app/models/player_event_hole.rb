class PlayerEventHole < ApplicationRecord
  belongs_to :event
  belongs_to :hole
  belongs_to :player
end
