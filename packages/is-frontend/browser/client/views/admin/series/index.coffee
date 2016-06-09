Template.adminSeries.helpers
  series: ->
    Series.find {},
      sort:
        seasonName: -1
        raceType: -1
        license: -1
      limit: 80
