class Track < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name

  default_scope ->{ order(:name) }

  FREE_TRACKS = [
    'centripetal circuit',
    'charlotte motor speedway',
    'lanier national speedway',
    'mazda raceway laguna seca',
    'lime rock park',
    'okayama international circuit',
    'oxford plains speedway',
    'south boston speedway',
    'summit point raceway',
    'tompson intl speedway',
    'usa international speedway'
  ]

  scope :free, ->{ where(["lower(name) in (?)", FREE_TRACKS]) }

  class << self
    def all_free_ids
      @all_free_ids ||= free.select(:id).map(&:id)
    end

    def is_free?(track_id)
      all_free_ids.include?(track_id)
    end
  end
end
