class PlayerEventHolesController < ApplicationController

  before_action :set_player_event_hole

  def show
    @previous_hole = @player_event_hole.previous_player_event_hole
    @next_hole = @player_event_hole.next_player_event_hole
  end

  def edit

  end

  def update
    @player_event_hole.update(player_event_hole_params)
  end

  private

  def set_player_event_hole
    @player_event_hole = PlayerEventHole.find(params[:id])
  end

  def player_event_hole_params
    params.require(:player_event_hole).permit(:score, :id)
  end
end
