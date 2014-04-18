class AddTrackIdsToUser < ActiveRecord::Migration
  def change
    add_column :users, :track_ids, :string
  end
end
