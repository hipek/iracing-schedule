class Admin.TracksController extends Admin.BaseController
  template: "adminTracks"
  waitOn: ->
    Meteor.subscribe 'adminTracks'
