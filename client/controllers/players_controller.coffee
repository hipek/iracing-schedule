class @PlayersController extends RouteController
  template: "playersIndex"

  waitOn: ->
    Meteor.subscribe 'teamPlayerSeasonSeries', @params.tid
