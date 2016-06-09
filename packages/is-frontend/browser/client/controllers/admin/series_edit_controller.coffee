class Admin.SeriesEditController extends Admin.BaseController
  template: "adminSeriesEdit"

  waitOn: ->
    Meteor.subscribe 'adminSeries', @params.id

  data: ->
    Series.findOne @params.id
