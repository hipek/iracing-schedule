Meteor.publish 'teamPlayerSeasonSeries', (teamId) ->
  teams = Teams.find slug: teamId

  seasons = Seasons.latest 2

  playerSeries = PlayerSeries.find
    teamId: teamId
    seasonId: $in: seasons.map (season) -> season._id

  series = Series.sorted
    seasonId: $in: seasons.map (season) -> season._id

  [teams, seasons, playerSeries, series]

Meteor.publish 'adminPlayerSeries', ->
  seasons = Seasons.find()
  playerSeries = PlayerSeries.find()

  [seasons, playerSeries]
