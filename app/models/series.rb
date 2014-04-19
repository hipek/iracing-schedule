class Series < ActiveRecord::Base
  belongs_to :season
  has_many :series_tracks, dependent: :destroy

  validates_presence_of :season

  default_scope ->{ order(:name) }

  class << self
    def latest
      Season.includes(:series).last.series
    end
  end
end
