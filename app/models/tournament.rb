class Tournament < ApplicationRecord  
    has_many :tournament_events
    has_many :events, through: :tournament_events
  end
  