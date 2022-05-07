class Event < ApplicationRecord
  belongs_to :course
  has_many :player_events
  has_many :players, through: :player_events
  has_many :player_event_holes
  has_many :holes, through: :player_event_holes

  def generate_scorecards
    # logic here to loop through PlayerEvents, generate scorecard link, and send text message
  end
end
