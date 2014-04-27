class AddNightOptionToSeriesTrack < ActiveRecord::Migration
  def change
    add_column :series_tracks, :night, :boolean, default: false
  end
end
