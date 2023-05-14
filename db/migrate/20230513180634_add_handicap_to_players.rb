class AddHandicapToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :handicap, :integer
  end
end
