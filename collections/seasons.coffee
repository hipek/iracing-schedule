@Seasons = new Mongo.Collection('seasons')

Seasons.attachSchema SeasonsSchema
Seasons.helpers SeasonsHelpers

Seasons.allow
  insert: (userId, doc) ->
    true

  update: (userId, doc) ->
    true

Seasons.latest = (limit = 1) ->
  @find {},
    sort:
      activeFrom: -1
    limit: limit

Seasons.latestId = ->
  @latest().fetch()[0]?._id

Seasons.currentId = ->
  season = @findOne
    activeFrom: $lte: new Date()
    activeTo: $gte: new Date()

  season?._id || @latestId()
