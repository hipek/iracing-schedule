@Series = new Mongo.Collection('series')

Series = @Series

Series.helpers SeriesHelpers
Series.attachSchema SeriesSchema

Series.allow
  insert: (userId, doc) ->
    true

  update: () ->
    true

  remove: ->
    true

Series.road = (seasonId) ->
  @sorted
    raceType: 'ROAD'
    seasonId: seasonId

Series.oval = (seasonId) ->
  @sorted
    raceType: 'OVAL'
    seasonId: seasonId

Series.sorted = (q={}) ->
  @find q, {sort: {raceType: -1, license: -1}}
