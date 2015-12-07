@PlayerSeriesHelpers =
  seasonName: ->
    Seasons.findOne
      _id: @seasonId
    ?.name
