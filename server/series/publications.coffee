Meteor.publish 'adminSeries', (seriesId) ->
  query = {}
  query['_id'] = seriesId if seriesId?
  Series.sorted query

Meteor.publish 'publicSeries', (seasonId) ->
  season = Seasons.find _id: seasonId
  series = Series.sorted {seasonId: seasonId}
  [season, series]

Meteor.publish 'mySeries', (teamId, seasonId) ->
  season = Seasons.find _id: seasonId
  teams = Teams.find {slug: teamId}
  playerSeries = PlayerSeries.find {teamId: teamId, seasonId: seasonId}
  names = _.map playerSeries.fetch(), (series) -> series.seriesName
  series = Series.sorted {seasonId: seasonId, name: {$in: names}}

  [teams, playerSeries, series, season]
