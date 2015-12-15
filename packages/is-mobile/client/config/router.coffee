Router.configure
  layoutTemplate: 'mobileLayout'
  loadingTemplate: 'loading'
  # notFoundTemplate: 'notFound'

Meteor.startup ->
  if Meteor.isClient
    location = Iron.Location.get()
    if location.queryObject.platformOverride
      Session.set('platformOverride', location.queryObject.platformOverride)

Router.route '/',
  name: 'home',
  controller: 'HomeController'
