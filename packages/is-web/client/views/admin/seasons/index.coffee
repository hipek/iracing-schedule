Template.adminSeasons.events
  "click a#newSeason": (e) ->
    e.preventDefault()
    AntiModals.overlay 'adminSeasonsNew'

  "click a#editSeason": (e) ->
    e.preventDefault()
    AntiModals.overlay 'adminSeasonsEdit',
      data:
        _id: $(e.currentTarget).attr('data-id')

  "click a#destroySeason": (e) ->
    e.preventDefault()
    Meteor.call '/seasons/destroy', $(e.currentTarget).attr('data-id'), @done

Template.adminSeasons.helpers
  seasons: ->
    Seasons.find()
