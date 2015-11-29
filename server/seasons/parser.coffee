class @SeasonParser
  @KEYWORDS = [
    'Season',
    'Winter Series',
    'Week',
    'Class Series',
    'ROAD',
    'OVAL'
  ]
  @MINS_LAPS      = /(\d{1,3})\s(laps|mins)/
  @MINS_LAPS_LINE = /^(laps|mins)$/
  @NIGHT_RACE = 'Night race'
  @BLACKLISTED_WORDS = [
    'Local enforced cautions',
    'Local advisory cautions',
    'Single file', ',',
    'Double file', 'course cautions',
    'Cautions disabled',
    @NIGHT_RACE
  ]
  @DATE = /\((\d{4}-\d{2}-\d{2})\)/

  constructor: (@data) ->
    @lines = @data.split(/\n/)

  series: ->
    list = []
    @read (ser) ->
      list.push ser
    list

  read: (callback) ->
    last = ''
    @lines.forEach (line) =>
      if @isKeyword line
        last = line
        @readLine line, callback
      else if @minsLaps(line).trim().length > 0
        idx = @season.tracks.length - 1
        @season.tracks[idx][2] = @minsLaps line
      else if @readCars last
        @cars = _.map line.trim().split(','), (name) -> name.trim()
        last = ''
      @previous_line = line

  readCars: (str) ->
    keywords = @constructor.KEYWORDS
    str.contains(keywords[0]) ||
    str.contains(keywords[1])

  isKeyword: (line) ->
    ok = null
    @constructor.KEYWORDS.forEach (key) ->
      ok = true if line.contains key
    ok

  readLine: (line, callback) ->
    if line.contains 'Class Series'
      @license = line.split('Class')[0].trim()
      return
    if line.contains('ROAD') || line.contains('OVAL')
      @raceType = line.trim()
      return

    night = line.contains(@constructor.NIGHT_RACE)
    list = @parseWeek line
    if list.length > 1
      @season.cars = _.clone @cars
      @season.tracks ||= []
      @season.tracks.push [
        list[0], list[1], '', night
      ]
    else
      callback @season if @season?
      @setSeason list[0]

  parseWeek: (line) ->
    week = @clear line.split(',')[0]
    track = week.split(@constructor.DATE).pop().trim()
    date = (week.match(@constructor.DATE) || [])[1]
    _.compact [date, track]

  clear: (text) ->
    @constructor.BLACKLISTED_WORDS.forEach (word) ->
      text = text.replace word, ' '
    text.trim().replace /\s+/g, ' '

  setSeason: (name) ->
    @season = {}
    @season.raceType = _.clone @raceType
    @season.license = _.clone @license
    @season.seasonName = @seasonName || @parseSeasonName(name)
    @seasonName ||= @season.seasonName
    @season.name = @parseSeriesName name

  minsLaps: (str) ->
    result = str.match @constructor.MINS_LAPS_LINE
    return @previous_line + ' ' + result[0] if result? && result.length > 1

    result = str.match @constructor.MINS_LAPS
    return '' if result == null || result.length < 2

    result[0]

  parseSeriesName: (str) ->
    str = str.replace @seasonName, ' '
    str = str.trim().replace /\s+/g, ' '
    str = str.replace(/\-\s?\-/, '-').trim()
    str.replace(/-$/, ' ').trim()

  parseSeasonName: (str) ->
    str.split(' - ').pop()
