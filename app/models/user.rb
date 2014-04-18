class User < ActiveRecord::Base
  def track_ids
    JSON.parse read_attribute(:track_ids) || '[]'
  end

  def track_ids=(list)
    list = (list || []).reject(&:blank?).map{|l| l.to_i}
    write_attribute(:track_ids, list.to_json)
  end

  def track_to_buy_ids
    JSON.parse read_attribute(:track_to_buy_ids) || '[]'
  end

  def track_to_buy_ids=(list)
    list = (list || []).reject(&:blank?).map{|l| l.to_i}
    write_attribute(:track_to_buy_ids, list.to_json)
  end

  def tracks
    @tracks ||= Track.find(track_ids)
  end

  def tracks_to_buy
    @tracks_to_buy ||= Track.find(track_to_buy_ids)
  end
end
