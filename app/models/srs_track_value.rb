class SrsTrackValue < ActiveRecord::Base
  belongs_to :user
  belongs_to :series_track

  validates_presence_of :user
  validates_presence_of :series_track
  validates_uniqueness_of :series_track_id, scope: :user_id
end
