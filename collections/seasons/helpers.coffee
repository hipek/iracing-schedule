@SeasonsHelpers =
  series: ->
    Series.find
      seasonId: @_id

  oneSeries: ->
    Series.findOne
      seasonId: @_id

  seriesActiveFrom: ->
    @oneSeries().tracks[0].date

  seriesActiveTo: ->
    tracks = @oneSeries().tracks
    endDate = new Date tracks[tracks.length - 1].date.getTime()
    endDate.setDate endDate.getDate() + 7
    endDate
