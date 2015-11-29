describe 'SeasonParser', ->
  describe '2015S1.txt', ->
    beforeEach ->
      @data = Fixture.load('2015S1.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it "has 38 series", ->
      expect(@series.length).toEqual 38

    describe "first series", ->
      beforeEach ->
        @ser = @series[0]

      it "has series name", ->
        expect(@ser.name).toEqual 'iRacing Advanced Legends'

      it "has season name", ->
        expect(@ser.seasonName).toEqual '2015 Season 1'

  describe '2015S4.txt', ->
    beforeEach ->
      @data = Fixture.load('2015S4.txt')
      @parser = new SeasonParser(@data)
      @series = @parser.series()

    it "has 35 series", ->
      expect(@series.length).toEqual 35

    describe "Winter Series", ->
      beforeEach ->
        @ser = _.findWhere @series, name: 'Verizon INDYCAR Winter Series'

      it "has series name", ->
        expect(@ser.name).toEqual 'Verizon INDYCAR Winter Series'

      it "has cars", ->
        expect(@ser.cars).toEqual ['Dallara DW12']

      it "has season name", ->
        expect(@ser.seasonName).toEqual '2015 Season 4'
