if typeof String::htmlSafe != 'function'
  String::htmlSafe = () ->
    new Spacebars.SafeString(this)

if typeof String::contains != 'function'
  String::contains = (key) ->
    this.indexOf(key) != -1
