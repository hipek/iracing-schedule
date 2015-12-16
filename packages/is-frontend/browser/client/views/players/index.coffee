Template.playersIndex.events
  "click a[data-action=addSeries]": (e) ->
    e.preventDefault()
    AntiModals.overlay 'playerSeriesNew',
      data:
        nickname: $(e.target).attr('data-nickname')
        seasonId: Seasons.latestId()

Template.playersIndex.helpers
  players: () ->
    Teams.findOne()?.players || []

  countTracks: (obj) ->
    _.keys obj || {}
    .length

  countPlayerSeries: (nickname) ->
    PlayerSeries.find
      seasonId: Seasons.latestId()
      playerNickname: nickname
    .count()
