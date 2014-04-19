module HomeHelper
  def user_track_css(user, track)
    if user.own_track?(track.track_id)
      'green participation'
    elsif user.to_buy_track?(track.track_id)
      'yellow participation'
    else
      'participation'
    end
  end
end
