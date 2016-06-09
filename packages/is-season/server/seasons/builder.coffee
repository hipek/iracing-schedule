class @SeasonBuilder
  @BLACKLISTED_WORDS = [
    'Full', 'Circuit', 'Speedway', 'Park',
    'Raceway', 'Course', 'Racing', '(Night) Dynamic weather',
    '(Night) Qual attached', '(Night)', 'Night', 'Dynamic weather',
    'Qual attached', '(Afternoon)', '(Late Afternoon)', '(Morning)'
  ]

  constructor: (@name, @data) ->
    @parser = new SeasonParser @data

  build: ->
    season = {}
    seriesList = []

    @parser.series().forEach (series) =>
      season.name ||= @name || series.seasonName
      ss = _.pick series, 'name', 'raceType', 'license', 'seasonName', 'cars'
      ss.tracks = []

      _.each series.tracks, (track, i) =>
        ss.tracks.push @buildTrack track, i

      seriesList.push ss

    seasonId = Seasons.insert season
    seriesList.forEach (series) ->
      Series.insert _.extend series, seasonId: seasonId

    doc = Seasons.findOne _id: seasonId

    return unless doc?

    Seasons.update
      _id: seasonId
    ,
      $set:
        activeFrom: doc.seriesActiveFrom()
        activeTo: doc.seriesActiveTo()

  buildTrack: (data, i) ->
    track =
      week: i + 1
      date: new Date Date.parse data[0]
      name: data[1]
      duration: data[2]
      night: data[3]
      trackId: @findOrCreateTrack data[1]

  findOrCreateTrack: (name) ->
    legacyYear = (name.match(/(20[0-9]{2})/) || [])[0]
    name = name.split(' - ')[0]
    name = [name, legacyYear].join(' ') if legacyYear && !name.contains(legacyYear)
    tname = _.clone name
    @constructor.BLACKLISTED_WORDS.forEach (word) ->
      tname = tname.replace word, ' '
    tname = tname.replace(/\s+/g, ' ').trim().toLowerCase()
    Tracks.findOne(key: ///#{tname}///)?._id || Tracks.insert(name: name, key: tname)

SeasonBuilder = @SeasonBuilder
