Meteor.publish 'adminTracks', ->
  Tracks.find()

Meteor.publish 'playerTracks', (team) ->
  [Tracks.find(), Teams.find(slug: team)]
