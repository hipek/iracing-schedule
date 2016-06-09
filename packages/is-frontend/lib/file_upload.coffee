class @FileUpload
  constructor: (@input) ->

  files: ->
    @input.files

  hasFile: ->
    @files().length > 0

  upload: (callback) ->
    _.each @files(), (file) =>
      reader = new FileReader()
      reader.onload = (fileLoadEvent) =>
        callback
          info: file
          data: reader.result

      # reader.readAsBinaryString file
      reader.readAsText file, 'UTF-8'
