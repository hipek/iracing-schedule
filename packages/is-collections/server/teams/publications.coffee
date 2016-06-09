Meteor.publish 'adminTeams', ->
  Teams.find()

Meteor.publish 'publicTeams', ->
  Teams.find()

Meteor.publish 'team', (team) ->
  Teams.find {slug: team}
