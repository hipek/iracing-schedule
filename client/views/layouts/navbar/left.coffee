Template.navbarLeft.helpers
  pastSeasons: ->
    Seasons.find
      activeTo: $lt: new Date()
    ,
      sort:
        activeFrom: -1

  upcommingSeasons: ->
    Seasons.find
      activeFrom: $gt: new Date()

  hasUpcommingSeasons: ->
    Seasons.find
      activeFrom: $gt: new Date()
    .count() > 0
