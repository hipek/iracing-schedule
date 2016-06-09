class Admin.TeamsController extends Admin.BaseController
  template: "adminTeams"
  waitOn: ->
    Meteor.subscribe 'adminTeams'
