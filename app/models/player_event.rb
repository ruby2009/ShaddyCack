class PlayerEvent < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :player
  belongs_to :event

  has_many :player_event_holes

  def build_scorecard
    event.course.holes.each do |hole|
      PlayerEventHole.find_or_create_by!(event_id: event.id, hole_id: hole.id, player_id: player.id, player_event_id: id)
    end
  end

  def generate_scorecard_link
    scorecard_path(id: id, magic_link: self.to_sgid(for: "sharing").to_s)
  end
end
