class Track < ActiveRecord::Base
  validates_uniqueness_of :name

  default_scope ->{ order(:name) }
end
