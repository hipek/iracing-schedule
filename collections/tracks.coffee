@Tracks = new Mongo.Collection('tracks')

Tracks.attachSchema TracksSchema

Tracks.allow
  insert: (userId, doc) ->
    true

  update: () ->
    true

  remove: ->
    true

Tracks.sorted = (q={}) ->
  Tracks.find q, {sort: {name: 1}}
