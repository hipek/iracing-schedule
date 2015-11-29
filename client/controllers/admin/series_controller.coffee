class Admin.SeriesController extends Admin.BaseController
  waitOn: ->
    Meteor.subscribe 'adminSeries'
