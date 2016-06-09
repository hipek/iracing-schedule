describe 'SeasonBuilder', ->
  before ->
    Seasons.remove({})

  describe '2016S2', ->
    before ->
      @builder = new SeasonBuilder(null, Factory.loadFixture('2016S2.txt'))
      @builder.build()

    it 'returns season', (test) ->
      test.equal Seasons.find().count(), 1

  describe '2016S3', ->
    before ->
      @builder = new SeasonBuilder(null, Factory.loadFixture('2016S3.txt'))
      @builder.build()

    it 'returns season', (test) ->
      test.equal Seasons.find().count(), 1
