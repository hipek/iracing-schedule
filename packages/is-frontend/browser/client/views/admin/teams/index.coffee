teamId = (e) ->
  $(e.target).attr('data-id')

Template.adminTeams.events
  'click a#newTeam': (e) ->
    e.preventDefault()
    AntiModals.overlay 'adminTeamsNew'

  'click a#editTeam': (e) ->
    e.preventDefault()
    AntiModals.overlay 'adminTeamsEdit',
      data:
        teamId: teamId(e)

  'click a#destroyTeam': (e) ->
    e.preventDefault()
    Meteor.call '/teams/destroy', teamId(e), @done

Template.adminTeams.helpers
  teams: ->
    Teams.find()
