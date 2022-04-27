class CreatePlayerEventHoles < ActiveRecord::Migration[7.0]
  def change
    create_table :player_event_holes do |t|
      t.references :event, null: false, foreign_key: true
      t.references :hole, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
