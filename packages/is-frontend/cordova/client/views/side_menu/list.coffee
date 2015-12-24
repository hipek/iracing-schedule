Template.sideMenuList.helpers
  getCurrentSeries: ->
    tid: UI._globalHelpers.currentTeamId()
    sid: UI._globalHelpers.currentSeasonId()

  getSeries: ->
    tid: UI._globalHelpers.currentTeamId()
    sid: @_id

  isSelectedTeam: ->
    UI._globalHelpers.currentTeamId() == @slug
