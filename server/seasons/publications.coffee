Meteor.publish 'adminSeason', (seasonId) ->
  seasons = Seasons.find
    _id: seasonId
  series  = Series.sorted
    seasonId: seasonId

  [seasons, series]

Meteor.publish 'adminSeasons', ->
  seasons = Seasons.latest 20
  series  = Series.sorted
    seasonId: $in: seasons.map (season) -> season._id

  [seasons, series]

Meteor.publish 'seasons', ->
  Seasons.latest(10)
