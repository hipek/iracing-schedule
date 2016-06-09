AutoForm.hooks
  insertSeasonForm:
    onSubmit: (doc) ->
      @event.preventDefault()
      input = $(@event.target)
        .find('input[type=file]').get(0)
      uploader = new FileUpload input

      return @done() unless uploader.hasFile()

      uploader.upload (data) =>
        data.doc = doc
        Meteor.call '/seasons/create', data, @done

    onSuccess: (operation, doc) ->
      Flash.success 'Season added.'
      AntiModals.dismissAll()
