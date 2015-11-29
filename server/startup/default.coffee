Meteor.startup () ->
  if Meteor.users.find(roles: Roles.ADMIN).count() < 1
    Meteor.users.find().forEach (user) ->
      Roles.addUsersToRoles user._id, [Roles.ADMIN]
