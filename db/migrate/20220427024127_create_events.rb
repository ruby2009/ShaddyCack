class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :startDate
      t.string :name
      t.text :tee_time_window, array: true, default: []
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
