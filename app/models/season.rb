class Season < ActiveRecord::Base
  attr_accessor :file

  has_many :series, dependent: :destroy
  has_many :user_seasons, dependent: :destroy, foreign_key: :season_id

  validates_presence_of   :name
  validates_uniqueness_of :name, :on => :create
  validates_presence_of   :file, :on => :create

  before_validation :read_seasons

  scope :active, ->{ where(active: true) }
  scope :past, ->{ where(active: false).order('name asc') }
  scope :current, -> { active }

  class << self
    def latest
      includes(:series).last
    end
  end

  def read_seasons
    self.series = ScheduleParser.new(file).series.map do |series|
      self.name = series.season_name if name.blank?
      ser = Series.new(
        name: series.series_name,
        license: series.license,
        race_type: series.race_type,
        season_id: id,
        cars: series.cars,
      )
      ser.series_tracks = series.tracks.each_with_index.map do |track, i|
        SeriesTrack.new(
          week: i + 1,
          date: track[0],
          name: track[1],
          duration: track[2],
          night: track[3]
        ).tap do |st|
          st.apply_track
        end
      end
      ser.season = self
      ser
    end if file.present?
  end

  def user_series(team)
    series.includes(series_tracks: [:track_values]).where(
      name: team.user_seasons.where(season_id: id).
        map{|us| us.series_names}.flatten.uniq
    )
  end

  def make_other_inactive
    self.class.where('id != ?', id).update_all active: false
  end
end
