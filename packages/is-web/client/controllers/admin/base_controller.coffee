class Admin.BaseController extends RouteController
  layoutTemplate: 'adminMainLayout'

  onBeforeAction: ->
    if Meteor.user()?.isAdmin()
      @next()
    else
      Router.go 'home'
