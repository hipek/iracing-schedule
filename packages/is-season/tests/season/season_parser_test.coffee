describe 'SeasonParser', ->
  describe '2015S1.txt', ->
    before ->
      @data = Factory.loadFixture('2015S1.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 38 series', (test) ->
      test.equal @series.length, 38

    describe 'first series', ->
      before ->
        @ser = @series[0]

      it 'has series name', (test) ->
        test.equal @ser.name, 'iRacing Advanced Legends'

      it 'has season name', (test) ->
        test.equal @ser.seasonName, '2015 Season 1'

  describe '2015S4.txt', ->
    before ->
      @data = Factory.loadFixture('2015S4.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 35 series', (test) ->
      test.equal @series.length, 35

    describe 'Winter Series', ->
      before ->
        @ser = _.findWhere @series, name: 'Verizon INDYCAR Winter Series'

      it 'has series name', (test) ->
        test.equal @ser.name, 'Verizon INDYCAR Winter Series'

      it 'has cars', (test) ->
        test.equal @ser.cars, ['Dallara DW12']

      it 'has season name', (test) ->
        test.equal @ser.seasonName, '2015 Season 4'

  describe '2016S1.txt', ->
    before ->
      @data = Factory.loadFixture('2016S1.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 38 series', (test) ->
      test.equal @series.length, 38

    describe 'first series', ->
      before ->
        @ser = @series[0]

      it 'has series name', (test) ->
        test.equal @ser.name, 'iRacing Advanced Legends'

      it 'has season name', (test) ->
        test.equal @ser.seasonName, '2016 Season 1'

  describe '2016S2.txt', ->
    before ->
      @data = Factory.loadFixture('2016S2.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 42 series', (test) ->
      test.equal @series.length, 42

    describe 'first series', ->
      before ->
        @ser = @series[0]

      it 'has series name', (test) ->
        test.equal @ser.name, 'iRacing Advanced Legends'

      it 'has season name', (test) ->
        test.equal @ser.seasonName, '2016 Season 2'

  describe '2016S3.txt', ->
    before ->
      @data = Factory.loadFixture('2016S3.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 41 series', (test) ->
      test.equal @series.length, 41

    describe 'first series', ->
      before ->
        @ser = @series[0]

      it 'has series name', (test) ->
        test.equal @ser.name, 'iRacing Advanced Legends'

      it 'has season name', (test) ->
        test.equal @ser.seasonName, '2016 Season 3'

  describe '2018S1.txt', ->
    before ->
      @data = Factory.loadFixture('2018S1.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 56 series', (test) ->
      test.equal @series.length, 56


    describe 'dirt series', ->
      before ->
        @ser = @series[42]

      it 'has series name', (test) ->
        test.equal @ser.name, 'iRacing Dirt Midget Cup'

      it 'has valid number of laps', (test) ->
        test.equal @ser.tracks[0][2], '20 laps'

  describe '2018S2.txt', ->
    before ->
      @data = Factory.loadFixture('2018S2.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it 'has 65 series', (test) ->
      test.equal @series.length, 65
