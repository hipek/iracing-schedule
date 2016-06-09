nickname = ->
  Router.current().params.nickname

teamId = ->
  Router.current().params.tid

team = ->
  Teams.findOne
    slug: teamId()

Template.playerTracksIndex.helpers
  playerTracks: ->
    Tracks.sorted()

  playerTrackKinds: (track) ->
    _.map _.values(PlayerTrackKinds), (kind) ->
      free = _.contains(FreeTracks, track.key) && kind == PlayerTrackKinds.OWN
      show = free || !_.contains(FreeTracks, track.key)

      playerTracks = team().player(nickname()).tracks || {}
      checked = playerTracks[track._id] == kind || free ||
        (kind == PlayerTrackKinds.DONT_WANT && !playerTracks[track._id])

      option =
        kind: kind
        track: track
        show: show
        checked: checked

Template.playerTracksIndex.events
  "click form button": (e) ->
    e.preventDefault()
    tracks = {}
    _.each $(e.target).parents('form').find('input:checked'), (input) ->
      val = $(input).val()
      if val != PlayerTrackKinds.DONT_WANT
        tracks[$(input).attr('name')] = val 

    Meteor.call '/teams/player-tracks/update',
      tracks: tracks
      nickname: nickname()
      team: teamId()
    , (error, result) ->
      unless error
        Flash.success 'Tracks added.'
        Router.go 'players', tid: teamId()
