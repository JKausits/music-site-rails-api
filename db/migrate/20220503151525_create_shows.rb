class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :rate, precision: 8, scale: 2
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
