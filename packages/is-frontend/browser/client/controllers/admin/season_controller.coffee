class Admin.SeasonController extends Admin.BaseController
  template: "adminSeason"

  waitOn: ->
    Meteor.subscribe 'adminSeason', @params.sid
