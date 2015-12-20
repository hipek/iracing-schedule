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

Template.registerHelper 'pastSeasons', ->
    Seasons.find
      activeTo: $lt: new Date()
    ,
      sort:
        activeFrom: -1

Template.registerHelper 'upcommingSeasons', ->
    Seasons.find
      activeFrom: $gt: new Date()

Template.registerHelper 'hasUpcommingSeasons', ->
    Seasons.find
      activeFrom: $gt: new Date()
    .count() > 0

Template.registerHelper 'team', ->
    Teams.findOne
      slug: UI._globalHelpers.currentTeamId()
