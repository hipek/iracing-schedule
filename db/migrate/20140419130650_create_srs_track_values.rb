class CreateSrsTrackValues < ActiveRecord::Migration
  def change
    create_table :srs_track_values do |t|
      t.integer :user_id
      t.integer :series_track_id
      t.string :value

      t.timestamps
    end
  end
end
