class ScorecardsController < ApplicationController
  def show
    sgid = scorecard_params
    @player_event = GlobalID::Locator.locate_signed(sgid, for: "sharing")
    @player = @player_event.player
    @holes = @player_event.player_event_holes.includes(:hole).order("holes.number")
    @current_hole= @holes.first
    @next_hole = @holes.second
    @previous_hole
  end

  private

  def scorecard_params
    params.require(:magic_link)
  end
end
