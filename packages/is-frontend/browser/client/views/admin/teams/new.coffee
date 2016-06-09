AutoForm.hooks
  insertTeamForm:
    onSuccess: (operation, campaign) ->
      Flash.success 'Team added.'
      AntiModals.dismissAll()
