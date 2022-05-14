class PlayerEventHole < ApplicationRecord
  belongs_to :event
  belongs_to :hole
  belongs_to :player
  belongs_to :player_event
  before_save :update_hole_state
  after_save :update_round
  after_update_commit { broadcast_replace_later_to("hole_leaderboard", target: "leaderboard", partial: "player_event_holes/leaderboard", locals: { player_event_hole: self }) }

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

  def hole_leaders
    PlayerEventHole.where(hole_id: self.hole_id, event_id: self.event_id, hole_complete: true).order(:score).limit(5)
  end

  private

  def update_hole_state
    if score > 0
      self.hole_complete = true
      self.over_par = self.score - self.hole.par
    else
      self.hole_complete = false
      self.over_par = nil
    end
  end

  def update_round
    self.player_event.update_round
  end
end
