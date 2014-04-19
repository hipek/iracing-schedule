class User < ActiveRecord::Base
  include JsonAttrAccessor.new(:track_ids, :track_to_buy_ids, type: :to_i).module

  validates_uniqueness_of :name
  validates_presence_of :name

  default_scope ->{ order(:name) }

  def tracks
    @tracks ||= Track.find(track_ids)
  end

  def tracks_to_buy
    @tracks_to_buy ||= Track.find(track_to_buy_ids)
  end

  def own_track?(track)
    track_ids.include?(track)
  end

  def to_buy_track?(track)
    track_to_buy_ids.include?(track)
  end
end
