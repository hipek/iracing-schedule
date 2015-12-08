Meteor.publish 'adminUsers', ->
  Meteor.users.find()
