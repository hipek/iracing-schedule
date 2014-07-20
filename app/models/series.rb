class Series < ActiveRecord::Base
  belongs_to :season
  has_many :series_tracks, dependent: :destroy

  validates_presence_of :season

  default_scope ->{ joins(:season).order('seasons.name desc, series.name asc') }

  accepts_nested_attributes_for :series_tracks

  class << self
    def latest
      (Season.active.latest || Season.first).series
    end
  end

  def users
    @users ||= UserSeason.where(
      ["series_names like ?", "%\"#{name}\"%"]
    ).where(season_id: season_id).includes(:user).map(&:user)
  end
end
