class CreateHoles < ActiveRecord::Migration[7.0]
  def change
    create_table :holes do |t|
      t.string :yardage
      t.integer :difficulty
      t.string :nickname
      t.text :about_text
      t.integer :par
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
