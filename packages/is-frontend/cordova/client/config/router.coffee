Meteor.startup ->
  if Meteor.isClient
    location = Iron.Location.get()
    if location.queryObject.platformOverride
      Session.set('platformOverride', location.queryObject.platformOverride)
