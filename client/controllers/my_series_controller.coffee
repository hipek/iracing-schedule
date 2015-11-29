class @MySeriesController extends RouteController
  template: "mySeriesIndex"
  waitOn: ->
    Meteor.subscribe 'mySeries', @params.tid, @params.sid

  data: ->
    Seasons.findOne _id: @params.sid
