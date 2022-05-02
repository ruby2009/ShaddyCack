class PlayersController < ApplicationController
  def create
    @player = Player.new(player_params.except(:event_id))
    @event = Event.find(params.dig(:player, :event_id))

    # These should be created at time of scorecard creation to keep this controller clean and quick
    # event.course.holes.each do |hole|
    #   PlayerEventHole.create(event_id: @event.id, hole_id: hole.id, player_id: @player.id)
    # end
  
    respond_to do |format|
      if @player.save
        PlayerEvent.create(player_id: @player.id, event_id: @event.id)
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_player_form", partial: "annual_sign_up/form", locals: {player: Player.new, errors: @player.errors}) }
      end
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone_number, :event_id)
  end
end
