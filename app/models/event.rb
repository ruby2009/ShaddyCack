class Event < ApplicationRecord
  belongs_to :course
  has_many :player_events
  has_many :players, through: :player_events
  has_many :player_event_holes
  has_many :holes, through: :player_event_holes

  def generate_scorecards
    SendEventScorecardsJob.perform_later(id)
  end
end
