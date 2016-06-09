AutoForm.hooks
  updateSeasonForm:
    onSuccess: (operation, doc) ->
      Flash.success 'Season updated.'
      AntiModals.dismissAll()

Template.adminSeasonsEdit.helpers
  season: ->
    doc = Seasons.findOne
      _id: @_id

    _.extend doc,
      activeFrom: doc.activeFrom || doc.seriesActiveFrom()
      activeTo: doc.activeTo || doc.seriesActiveTo()
