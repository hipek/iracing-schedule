class Track < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name

  default_scope ->{ order(:name) }
end
