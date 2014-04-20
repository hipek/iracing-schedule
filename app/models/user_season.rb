class UserSeason < ActiveRecord::Base
  include JsonAttrAccessor.new(:series_names).module

  belongs_to :user
  belongs_to :season
  belongs_to :team

  validates_presence_of :user
  validates_presence_of :season
  validates_presence_of :series_names
  validates_uniqueness_of :season, scope: :user
end
