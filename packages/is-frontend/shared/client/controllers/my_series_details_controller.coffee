class @MySeriesDetailsController extends RouteController
  template: "mySeriesDetailsIndex"
  waitOn: ->
    Meteor.subscribe 'mySeries', @params.tid, @params.sid

  data: ->
    Series.findOne _id: @params.seriesId
