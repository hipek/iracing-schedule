@PlayerSeriesSchema = new SimpleSchema
  seasonId:
    type: String
  teamId:
    type: String
  playerNickname:
    type: String
  seriesName:
    type: String
  tracks:
    type: Object
    blackbox: true
    optional: true

@PlayerSeriesSelectSchema = new SimpleSchema
  playerNickname:
    type: String
    autoform:
      afFormGroup:
        label: false
      type: 'hidden'
  teamId:
    type: String
    optional: true
    autoform:
      afFormGroup:
        label: false
      type: 'hidden'
  seasonId:
    type: String
    optional: true
    autoform:
      afFormGroup:
        label: false
      type: 'hidden'
  seriesRoad:
    type: [String]
    optional: true
    autoform:
      class: 'series-select'
  seriesOval:
    type: [String]
    optional: true
    autoform:
      class: 'series-select'
