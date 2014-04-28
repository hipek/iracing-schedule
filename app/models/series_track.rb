class SeriesTrack < ActiveRecord::Base
  belongs_to :track
  has_many :track_values,
    class_name: 'SrsTrackValue',
    foreign_key: :series_track_id,
    dependent: :destroy

  def apply_track
    tname = name.split(' - ').first.strip
    self.track = Track.find_or_create_by(name: tname)
  end

  def value_for_user(user)
    track_values.to_a.find{|v| v.user_id == user.id}
  end

  def display_name
    "#{name}#{night ? ' (N)' : ''}"
  end

  def current?
    Time.now.to_date >= date &&
    Time.now.to_date < (date + 7)
  end
end
