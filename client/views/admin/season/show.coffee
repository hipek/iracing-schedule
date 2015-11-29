Template.adminSeason.helpers
  name: ->
    Seasons.findOne
      _id: UI._globalHelpers.paramsSeasonId()
    .name
