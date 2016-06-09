AutoForm.hooks
  insertPlayerSeriesForm:
    onSubmit: (doc) ->
      @event.preventDefault()
      Meteor.call '/player-series/save', doc, @done

    onSuccess: ->
      Flash.success 'Series added.'
      AntiModals.dismissAll()

Template.playerSeriesNew.helpers
  doc: ->
    data =
      playerNickname: @nickname
      teamId: UI._globalHelpers.currentTeamId()
      seasonId: @seasonId
    names = _.map PlayerSeries.find(data).fetch(), (s) -> s.seriesName
    _.extend data,
      seriesOval: names
      seriesRoad: names

  roadOptions: ->
    _.map Series.road(@seasonId).fetch(), (series) ->
      option =
        label: "[#{series.license}] #{series.name}"
        value: series.name

  ovalOptions: ->
    _.map Series.oval(@seasonId).fetch(), (series) ->
      option =
        label: "[#{series.license}] #{series.name}"
        value: series.name

  seasonName: ->
    Seasons.findOne
      _id: @seasonId
    .name
