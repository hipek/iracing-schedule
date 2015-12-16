Template.adminTeamsEdit.helpers
  team: ->
    Teams.findOne
      _id: @teamId

AutoForm.hooks
  updateTeamForm:
    onSubmit: (doc) ->
      @event.preventDefault()
      Meteor.call '/admin/teams/update',
        id: @docId
        doc: doc
      , @done()

    onSuccess: (doc) ->
      Flash.success 'Team updated.'
      AntiModals.dismissAll()
