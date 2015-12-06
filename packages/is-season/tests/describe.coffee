class DescribeData
  constructor:(@name) ->
    @befores  = []
    @sets     = []

@describe = (->
  _describe = (data, desc, fn) ->
    data.push new DescribeData desc

    @describe = _describe.bind(@, data)

    @set = (d, f) ->
      data.slice(-1)[0].sets.push name: d, fn: f

    @before = (bfn) ->
      data.slice(-1)[0].befores.push bfn

    @it = (d, f) ->
      _data = data.slice(0)

      ttf = ->
        _data.forEach (descData) ->
          descData.sets.forEach (set) ->
            @[set.name] = set.fn

        _data.forEach (descData) ->
          descData.befores.forEach (bfn) ->
            bfn()

        f.apply @, arguments

      name = _.map data, (dd) -> dd.name
        .concat(d).join(' - ')

      if f.length <= 1
        Tinytest.add name , ttf
      else
        Tinytest.addAsync name, ttf

    fn.bind(@)()

    data.pop()
)().bind @, []
