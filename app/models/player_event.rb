class PlayerEvent < ApplicationRecord
  belongs_to :player
  belongs_to :event
end
