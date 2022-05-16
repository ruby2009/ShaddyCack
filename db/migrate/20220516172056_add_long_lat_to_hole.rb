class AddLongLatToHole < ActiveRecord::Migration[7.0]
  def change
    add_column :holes, :green_long, :string
    add_column :holes, :green_lat, :string
  end
end
