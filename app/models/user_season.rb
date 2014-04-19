class UserSeason < ActiveRecord::Base
  include JsonAttrAccessor.new(:series_names).module
end
