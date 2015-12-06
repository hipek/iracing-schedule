@SeasonsSchema = new SimpleSchema
  name:
    type: String
    optional: true
  fileId:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: 'file'

  activeFrom:
    type: Date
    optional: true

  activeTo:
    type: Date
    optional: true
