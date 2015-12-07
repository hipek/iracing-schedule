AutoForm.hooks
  updateSeriesForm:
    onSuccess: (operation, doc) ->
      Flash.success 'Series updated.'
