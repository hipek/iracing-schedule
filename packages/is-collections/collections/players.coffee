@Players = new Mongo.Collection('players')

Players = @Players

Players.attachSchema PlayersSchema

Players.allow
  insert: (userId, doc) ->
    true
