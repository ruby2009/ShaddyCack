class PlayerEvent < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :player
  belongs_to :event

  has_many :player_event_holes

  after_update_commit { broadcast_replace_later_to("event_leaders", target: "event_leaders", partial: "scorecards/event_leaders", locals: { player_event: self }) }

  def build_scorecard
    event.course.holes.each do |hole|
      PlayerEventHole.find_or_create_by!(event_id: event.id, hole_id: hole.id, player_id: player.id, player_event_id: id)
    end
  end

  def generate_scorecard_link
    scorecard_path(id: id, magic_link: self.to_sgid(for: "sharing").to_s)
  end

  def update_round
    self.completed_holes = player_event_holes.where(hole_complete: true).count
    self.strokes_to_par = player_event_holes.where(hole_complete: true).map(&:over_par).sum
    self.save
  end

  def event_leaders
    PlayerEvent.where(event_id: self.event_id).where('completed_holes > ?', 0).order(:strokes_to_par)
  end
end
