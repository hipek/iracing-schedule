Meteor.methods
  '/player-series/save': (data) ->
    data.seriesRoad ||= []

    series = data.seriesRoad.concat data.seriesOval
    series = _.compact series

    doc = _.pick data, 'seasonId', 'teamId', 'playerNickname'

    found             = PlayerSeries.find(doc).fetch()
    foundSeriesNames  = _.map found, (item) -> item.seriesName

    PlayerSeries.remove
      seriesName:
        $in: _.difference foundSeriesNames, series

    series.forEach (s) ->
      d = _.extend doc, seriesName: s
      PlayerSeries.upsert d, $set: d

Meteor.methods
  '/player-series/set-value': (data) ->
    tracks = PlayerSeries.findOne(_id: data.seriesId).tracks || {}
    tracks[data.trackId] = data.value

    PlayerSeries.update
      _id: data.seriesId,
    ,
      $set:
        tracks: tracks
