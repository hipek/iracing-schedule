describe "SeasonBuilder", ->
  before ->
    @data = Factory.loadFixture('2014S3.txt')
    @builder = new SeasonBuilder(null, @data)

  it 'returns season', ->
    @builder.build()
