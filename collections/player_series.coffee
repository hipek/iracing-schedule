@PlayerSeries = new Mongo.Collection('player_series')

PlayerSeries.attachSchema PlayerSeriesSchema
PlayerSeries.helpers PlayerSeriesHelpers

PlayerSeries.allow
  insert: (userId, doc) ->
    true
