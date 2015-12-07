@TeamsHelpers =
  playerList: ->
    _.map @players, (player) ->
      [player.nickname, player.name].join ': '
    .join ', '

  player: (nickname) ->
    _.findWhere @players, nickname: nickname
