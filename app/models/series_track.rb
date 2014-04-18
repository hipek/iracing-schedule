class SeriesTrack < ActiveRecord::Base
  belongs_to :track

  def apply_track
    tname = name.split('-').first.strip
    self.track = Track.find_or_initialize_by(name: tname)
  end
end
