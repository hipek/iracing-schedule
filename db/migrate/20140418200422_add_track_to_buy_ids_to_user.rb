class AddTrackToBuyIdsToUser < ActiveRecord::Migration
  def change
    add_column :users, :track_to_buy_ids, :string
  end
end
