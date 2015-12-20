Template.series.helpers
  series: ->
    list = Series.sorted
      seasonId: UI._globalHelpers.paramsSeasonId()
    .fetch()

    result = []
    i = 0

    while i < list.length
      result.push
        rowSeries: list.slice i, i + 2
      i = i + 2

    result

  team: ->
    Teams.findOne
      slug: UI._globalHelpers.currentTeamId()
