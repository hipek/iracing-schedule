class User < ActiveRecord::Base
  def track_ids
    JSON.parse read_attribute(:track_ids) || '[]'
  end

  def track_ids=(list)
    list = (list || []).reject(&:blank?).map{|l| l.to_i}
    write_attribute(:track_ids, list.to_json)
  end

  def tracks
    @tracks ||= Track.find(track_ids)
  end
end
