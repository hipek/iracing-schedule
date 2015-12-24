Template.mySeriesDetailsIndex.helpers
  season: ->
    Seasons.findOne _id: UI._globalHelpers.paramsSeasonId()
