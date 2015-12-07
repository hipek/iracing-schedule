@FreeTracks = [
  'charlotte motor',
  'lanier national',
  'lime rock',
  'mazda laguna seca',
  'okayama international',
  'oxford plains',
  'south boston',
  'summit point',
  'usa international'
]

@PlayerTrackKinds =
  OWN: 'own'
  TO_BUY: 'to_buy'
  DONT_WANT: 'dont_want'

PlayerTrack = new SimpleSchema
  trackId:
    type: String
  kind:
    type: String
    autoform:
      options: _.values PlayerTrackKinds

Player = new SimpleSchema
  nickname:
    type: String
  name:
    type: String
  tracks:
    optional: true
    type: Object
    blackbox: true
    autoform:
      omit: true

@TeamsSchema = new SimpleSchema
  name:
    type: String
  slug:
    type: String
  players:
    type: [Player]
