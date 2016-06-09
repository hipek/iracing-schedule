Template.series.events
  'change input[data-track][data-series]': (e) ->
    input = $(e.target)
    Meteor.call '/player-series/set-value',
      seriesId: input.attr('data-series')
      trackId: input.attr('data-track')
      value:   input.val()
    , @done
