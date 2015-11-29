Meteor.methods
  '/teams/destroy': (id) ->
    Teams.remove
      _id: id

  '/teams/player-tracks/update': (data) ->
    team = Teams.findOne
      slug: data.team

    player = team.player data.nickname
    player.tracks = data.tracks

    Teams.update
      _id: team._id
    ,
      $set:
        players: team.players

  '/admin/teams/update': (data) ->
    team = Teams.findOne data.id

    data.doc.players.forEach (player, idx) ->
      player.tracks = team.players[idx]?.tracks || {}

    Teams.update
      _id: team._id
    ,
      $set: data.doc
