class Series < ActiveRecord::Base
  belongs_to :season
  has_many :series_tracks, dependent: :destroy

  validates_presence_of :season

  default_scope ->{ order(:name) }

  accepts_nested_attributes_for :series_tracks

  class << self
    def latest
      Season.active.latest.series
    end
  end

  def users
    @users ||= UserSeason.where(
      ["series_names like ?", "%\"#{name}\"%"]
    ).includes(:user).map(&:user)
  end
end
