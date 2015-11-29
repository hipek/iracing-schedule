SeriesTrack = new SimpleSchema
  week:
    type: Number
    autoform:
      class: 'week'
  date:
    type: Date
    autoform:
      class: 'date'
  name:
    type: String
    autoform:
      class: 'name'
  duration:
    type: String
    optional: true
    autoform:
      class: 'duration'
  night:
    type: Boolean
    autoform:
      class: 'night'
  trackId:
    type: String
    autoform:
      afFormGroup:
        label: false
      type: 'hidden'

@SeriesSchema = new SimpleSchema
  name:
    type: String
  seasonName:
    type: String
  seasonId:
    type: String
    autoform:
      afFormGroup:
        label: false
      type: 'hidden'
  license:
    type: String
  raceType:
    type: String
  cars:
    type: [String]
  tracks:
    type: [SeriesTrack]
