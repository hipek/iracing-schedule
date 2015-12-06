describe 'SeasonParser', ->
  describe '2015S1.txt', ->
    before ->
      @data = Factory.loadFixture('2015S1.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it "has 38 series", (test) ->
      test.equal @series.length, 38

    describe "first series", ->
      before ->
        @ser = @series[0]

      it "has series name", (test) ->
        test.equal @ser.name, 'iRacing Advanced Legends'

      it "has season name", (test) ->
        test.equal @ser.seasonName, '2015 Season 1'

  describe '2015S4.txt', ->
    before ->
      @data = Factory.loadFixture('2015S4.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it "has 35 series", (test) ->
      test.equal @series.length, 35

    describe "Winter Series", ->
      before ->
        @ser = _.findWhere @series, name: 'Verizon INDYCAR Winter Series'

      it "has series name", (test) ->
        test.equal @ser.name, 'Verizon INDYCAR Winter Series'

      it "has cars", (test) ->
        test.equal @ser.cars, ['Dallara DW12']

      it "has season name", (test) ->
        test.equal @ser.seasonName, '2015 Season 4'

  describe '2016S1.txt', ->
    before ->
      @data = Factory.loadFixture('2016S1.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it "has 38 series", (test) ->
      test.equal @series.length, 38

    describe "first series", ->
      before ->
        @ser = @series[0]

      it "has series name", (test) ->
        test.equal @ser.name, 'iRacing Advanced Legends'

      it "has season name", (test) ->
        test.equal @ser.seasonName, '2016 Season 1'
