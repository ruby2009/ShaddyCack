class TournamentEvent < ApplicationRecord
    belongs_to :tournament
    belongs_to :event
  end
  