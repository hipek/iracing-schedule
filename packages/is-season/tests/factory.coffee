class @Factory
  @fs: ->
    @_fs ||= Npm.require 'fs'

  @loadFixture: (name) ->
    path = process.env.PWD
    path += if path.match /packages/
      ''
    else
      '/packages/is-core'
    path = path + '/tests/fixtures/' + name
    @fs().readFileSync path, 'utf8'
