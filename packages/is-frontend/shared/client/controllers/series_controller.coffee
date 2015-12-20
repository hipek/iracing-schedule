class @SeriesController extends RouteController
  template: "seriesIndex"
  waitOn: ->
    Meteor.subscribe 'publicSeries', @params.sid

  data: ->
    Seasons.findOne _id: @params.sid
