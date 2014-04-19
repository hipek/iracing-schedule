class UserSeason < ActiveRecord::Base
  include JsonAttrAccessor.new(:series_names).module

  belongs_to :user
  belongs_to :season
end
