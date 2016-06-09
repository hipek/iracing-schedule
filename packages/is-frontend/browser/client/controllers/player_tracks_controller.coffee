class @PlayerTracksController extends RouteController
  template: "playerTracksIndex"
  waitOn: ->
    Meteor.subscribe 'playerTracks', @params.tid, @params.nickname
