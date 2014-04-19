class Series < ActiveRecord::Base
  belongs_to :season
  has_many :series_tracks, dependent: :destroy

  validates_presence_of :season

  default_scope ->{ order(:name) }

  class << self
    def latest
      Season.latest.series
    end
  end

  def users
    @users ||= UserSeason.where(
      ["series_names like ?", "%\"#{name}\"%"]
    ).includes(:user).map(&:user)
  end
end
