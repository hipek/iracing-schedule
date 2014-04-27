class User < ActiveRecord::Base
  include JsonAttrAccessor.new(:track_ids).module

  validates_uniqueness_of :name
  validates_presence_of :name

  default_scope ->{ order(:name) }

  has_many :user_seasons, dependent: :destroy

  belongs_to :team

  OWN    = 'own'
  TO_BUY = 'to_buy'

  def tracks
    @tracks ||= Track.find(track_owned_ids)
  end

  def tracks_to_buy
    @tracks_to_buy ||= Track.find(track_to_buy_ids)
  end

  def track_owned_ids
    @track_owned_ids ||= track_ids.map do |key, value|
      key.to_i if value == OWN
    end.flatten.reject(&:blank?)
  end

  def track_to_buy_ids
    @track_to_buy_ids ||= track_ids.map do |key, value|
      key.to_i if value == TO_BUY
    end.flatten.reject(&:blank?)
  end

  def own_track?(track)
    track_ids.include?(track) || track_owned_ids.include?(track)
  end

  def to_buy_track?(track)
    track_to_buy_ids.include?(track)
  end

  def ignored_track?(track)
    !(own_track?(track) || to_buy_track?(track))
  end
end
