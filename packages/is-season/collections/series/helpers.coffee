currentWeek = (date) ->
  startDate = new Date date.getTime()
  endDate   = new Date date.getTime()
  endDate.setDate endDate.getDate() + 7

  curr = new Date()

  if startDate.getTime() < curr.getTime() && endDate.getTime() > curr.getTime()
    'active'
  else
    ''

@SeriesHelpers =
  seriesName: ->
    "[#{@license}] [#{@raceType}] #{@name}"

  playerSeries: ->
    PlayerSeries.find
      seasonId: @seasonId
      seriesName: @name
    ,
      sort:
        playerNickname: 1

  playerSeriesTracks: ->
    _.map @tracks, (track) =>
      _.extend track,
        currentWeek: currentWeek track.date
        playerSeries: @playerSeries()
        name: if track.night then "#{track.name} (N)" else track.name
        playerSeriesTrackData: (team) =>
          @playerSeries().map (ps) ->
            tracks = team?.player(ps.playerNickname).tracks || {}
            kind: tracks[track.trackId]
            value: (ps.tracks || {})[track.trackId]
            trackId: track.trackId
            seriesId: ps._id

  carNames: ->
    @cars.join ', '
