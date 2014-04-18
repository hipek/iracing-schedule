class Season < ActiveRecord::Base
  attr_accessor :file

  has_many :series, dependent: :destroy

  validates_presence_of   :name
  validates_uniqueness_of :name, :on => :create
  validates_presence_of   :file, :on => :create

  before_validation :read_seasons

  def read_seasons
    ScheduleParser.new(file).series.each do |series|
      self.name ||= series.name.split(' - ').last
      ser = Series.new(name: series.name.split('-').first.strip)
      ser.series_tracks = series.tracks.each_with_index.map do |track, i|
        SeriesTrack.new(
          week: i + 1,
          date: track[0],
          name: track[1],
          duration: track[2],
        )
      end
      self.series << ser
    end if file.present?
  end
end
