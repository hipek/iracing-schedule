class AddLicenseAndRaceTypeToSeries < ActiveRecord::Migration
  def change
    add_column :series, :license, :string
    add_column :series, :race_type, :string
  end
end
