Router.configure
  layoutTemplate: 'mobileLayout'
  # notFoundTemplate: 'notFound'
  # loadingTemplate: 'loading'

Meteor.startup ->
  if Meteor.isClient
    location = Iron.Location.get()
    if location.queryObject.platformOverride
      Session.set('platformOverride', location.queryObject.platformOverride)

Router.route '/',
  name: 'home',
  controller: 'HomeController'
