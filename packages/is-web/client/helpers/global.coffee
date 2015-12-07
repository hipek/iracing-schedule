Template.registerHelper 'displayDate', (d) ->
  d.toISOString().split('T')[0]

Template.registerHelper 'currentTeamId', ->
  Router.current().params.tid

Template.registerHelper 'currentSeasonId', ->
  Seasons.currentId()

Template.registerHelper 'paramsSeasonId', ->
  Router.current().params.sid

Template.registerHelper 'isAdmin', ->
  Meteor.user()?.isAdmin()
