class Admin.PlayerSeriesController extends Admin.BaseController
  waitOn: ->
    Meteor.subscribe 'adminPlayerSeries'
