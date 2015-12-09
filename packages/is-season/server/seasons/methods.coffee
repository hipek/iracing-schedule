Meteor.methods
  '/seasons/create': (data) ->
    @builder = new SeasonBuilder(
      data.doc.name,
      data.data.toString()
    )
    @builder.build()

Meteor.methods
  '/seasons/destroy': (id) ->
    Seasons.remove _id: id
    Series.remove seasonId: id
    PlayerSeries.remove seasonId: id
