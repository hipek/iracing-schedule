Template.adminPlayerSeries.helpers
  playerSeries: ->
    PlayerSeries.find {},
      sort:
        seasonId: 1
        teamId: 1
        playerNickname: 1
        seriesName: 1
