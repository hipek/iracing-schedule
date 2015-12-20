Template.mySeriesDetailsIndex.helpers
  season: ->
    Seasons.findOne _id: @params.sid
