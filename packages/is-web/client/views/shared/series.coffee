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

Template.series.events
  'change input[data-track][data-series]': (e) ->
    input = $(e.target)
    Meteor.call '/player-series/set-value',
      seriesId: input.attr('data-series')
      trackId: input.attr('data-track')
      value:   input.val()
    , @done
