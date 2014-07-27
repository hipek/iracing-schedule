class AddCarsToSeries < ActiveRecord::Migration
  def change
    add_column :series, :cars, :string, array: true, default: []
  end
end
