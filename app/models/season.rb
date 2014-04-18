class Season < ActiveRecord::Base
  has_many :series, dependent: :destroy

  class << self
    def from_file(file)
      season = new
      ScheduleParser.new(file).series.each do |series|
        season.name ||= series.name.split(' - ').last
        ser = Series.new(name: series.name.split('-').first.strip)
        ser.series_tracks = series.tracks.each_with_index.map do |track, i|
          SeriesTrack.new(
            week: i + 1,
            date: track[0],
            name: track[1],
            duration: track[2],
          )
        end
        season.series << ser
      end
      season
    end
  end
end
