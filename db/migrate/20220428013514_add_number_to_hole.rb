class AddNumberToHole < ActiveRecord::Migration[7.0]
  def change
    add_column :holes, :number, :integer
    add_column :holes, :handicap, :integer
  end
end
