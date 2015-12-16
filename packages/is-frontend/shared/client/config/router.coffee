Router.configure
  layoutTemplate: 'mainLayout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

Router.route '/',
  name: 'home',
  controller: 'HomeController'
Router.route '/teams',
  name: 'teams',
  controller: 'TeamsController'
Router.route '/:tid/seasons/:sid',
  name: 'seasons',
  controller: 'SeasonsController'
Router.route '/:tid/series/:sid',
  name: 'series',
  controller: 'SeriesController'
Router.route '/:tid/my-series/:sid',
  name: 'mySeries',
  controller: 'MySeriesController'
Router.route '/:tid/players',
  name: 'players',
  controller: 'PlayersController'
Router.route '/:tid/player/:nickname/tracks',
  name: 'playerTracks',
  controller: 'PlayerTracksController'
