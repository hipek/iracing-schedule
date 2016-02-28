class Admin.BaseController extends RouteController
  layoutTemplate: 'adminMainLayout'

  onBeforeAction: ->
    if true || Meteor.user()?.isAdmin()
      @next()
    else
      Router.go 'home'
