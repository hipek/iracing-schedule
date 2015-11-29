@Players = new Mongo.Collection('players')

Players.attachSchema PlayersSchema

Players.allow
  insert: (userId, doc) ->
    true
