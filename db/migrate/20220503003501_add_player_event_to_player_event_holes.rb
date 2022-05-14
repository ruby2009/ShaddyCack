class AddPlayerEventToPlayerEventHoles < ActiveRecord::Migration[7.0]
  def change
    add_reference :player_event_holes, :player_event, null: false, foreign_key: true
  end
end
