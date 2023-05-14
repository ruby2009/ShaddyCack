class CreateTournamentEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :tournament_events do |t|
      t.references :event, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
