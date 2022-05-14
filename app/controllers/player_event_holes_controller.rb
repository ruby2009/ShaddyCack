class PlayerEventHolesController < ApplicationController

  before_action :set_player_event_hole

  def show
    @previous_hole = @player_event_hole.previous_player_event_hole
    @next_hole = @player_event_hole.next_player_event_hole
    # Turbo::StreamsChannel.broadcast_replace_later_to("hole_leaderboard", target: "leaderboard", partial: "player_event_holes/leaderboard", locals: { player_event_hole: @player_event_hole })
  end

  def edit

  end

  def update
    @player_event_hole.update(player_event_hole_params)
    @hole_ids = @player_event_hole.player_event.player_event_holes.includes(:hole).order("holes.number").map(&:id)
    Turbo::StreamsChannel.broadcast_replace_later_to("#{ActionView::RecordIdentifier.dom_id(@player_event_hole.player)}player_scorecard", target: "player_scorecard", partial: "scorecards/player_scorecard", locals: { hole_ids: @hole_ids })
  end

  private

  def set_player_event_hole
    @player_event_hole = PlayerEventHole.find(params[:id])
  end

  def player_event_hole_params
    params.require(:player_event_hole).permit(:score, :id)
  end
end
