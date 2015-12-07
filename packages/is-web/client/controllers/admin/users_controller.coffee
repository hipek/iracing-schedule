class Admin.UsersController extends Admin.BaseController
  waitOn: ->
    Meteor.subscribe 'adminUsers'
