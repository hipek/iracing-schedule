class CreateSeriesTracks < ActiveRecord::Migration
  def change
    create_table :series_tracks do |t|
      t.integer :series_id
      t.integer :track_id
      t.string :name
      t.date :date
      t.integer :week
      t.string :duration

      t.timestamps
    end
  end
end
