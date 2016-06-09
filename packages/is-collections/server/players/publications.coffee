Meteor.publish 'teamPlayers', (teamId) ->
  Players.find()
