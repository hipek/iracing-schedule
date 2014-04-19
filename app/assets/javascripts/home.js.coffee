class window.Participation
  constructor: () ->
    @bind()

  bind: () ->
    $('input[data-series-track-id]').blur (e) ->
      id      = $(e.target).data('series-track-id')
      user_id = $(e.target).data('user-id')
      val     = $(e.target).val()
      $.post('/series_track_values/' + id, {user_id: user_id, value: val})