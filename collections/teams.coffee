@Teams = new Mongo.Collection('teams')

Teams.helpers TeamsHelpers

Teams.allow
  insert: (userId, doc) ->
    true

  update: () ->
    true

  remove: ->
    true
