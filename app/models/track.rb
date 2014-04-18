class Track < ActiveRecord::Base
  default_scope ->{ order(:name) }
end
