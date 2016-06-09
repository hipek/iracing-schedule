@UsersHelpers =
  isAdmin: ->
    Roles.userIsInRole @, Roles.ADMIN

  email: ->
    @emails?[0]?.address || @services?.google?.email

  service: ->
    _.keys @services || {}
