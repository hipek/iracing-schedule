class UpdateUserTracksColumns < ActiveRecord::Migration
  def change
    remove_column :users, :track_to_buy_ids, :string
    change_column :users, :track_ids, :text
  end
end
