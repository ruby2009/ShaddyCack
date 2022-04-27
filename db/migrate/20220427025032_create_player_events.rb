class CreatePlayerEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :player_events do |t|
      t.references :player, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.text :tee_time_windows, array: true, default: []

      t.timestamps
    end
  end
end
