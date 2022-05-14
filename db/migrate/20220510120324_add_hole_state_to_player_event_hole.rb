class AddHoleStateToPlayerEventHole < ActiveRecord::Migration[7.0]
  def change
    add_column :player_event_holes, :hole_complete, :boolean
    add_column :player_event_holes, :over_par, :integer
  end
end
