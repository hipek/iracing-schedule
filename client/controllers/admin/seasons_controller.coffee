class Admin.SeasonsController extends Admin.BaseController
  template: "adminSeasons"

  waitOn: ->
    Meteor.subscribe 'adminSeasons'
