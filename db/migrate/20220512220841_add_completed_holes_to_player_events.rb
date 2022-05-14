class AddCompletedHolesToPlayerEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :player_events, :completed_holes, :integer, default: 0
    add_column :player_events, :round_complete, :boolean
    add_column :player_events, :strokes_to_par, :integer, default: 0
  end
end
