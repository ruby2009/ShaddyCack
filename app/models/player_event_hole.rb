class PlayerEventHole < ApplicationRecord
  belongs_to :event
  belongs_to :hole
  belongs_to :player
  belongs_to :player_event

  def previous_player_event_hole
    previous_hole = Hole.find_by(number: hole.number - 1, course_id: hole.course_id)
    if previous_hole
      PlayerEventHole.find_by(player_id: player_id, event_id: event_id, hole_id: previous_hole.id)
    end
  end

  def next_player_event_hole
    next_hole = Hole.find_by(number: hole.number + 1, course_id: hole.course_id)
    if next_hole
      PlayerEventHole.find_by(player_id: player_id, event_id: event_id, hole_id: next_hole.id)
    end
  end
end
