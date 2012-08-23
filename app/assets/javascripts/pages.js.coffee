$(document).ready ->
  $("#thanks").fadeIn 5000
  $("h2#thanks").scrambledWriter()

(($) ->
  shuffle = (a) ->
    i = a.length
    j = undefined
    while i
      j = Math.floor((i--) * Math.random())
      t = a[i]
      a[i] = a[j]
      a[j] = t
  randomAlphaNum = ->
    rnd = Math.floor(Math.random() * 62)
    if rnd >= 52
      String.fromCharCode rnd - 4
    else if rnd >= 26
      String.fromCharCode rnd + 71
    else
      String.fromCharCode rnd + 65
  $.fn.rot13 = ->
    @each ->
      $(this).text $(this).text().replace(/[a-z0-9]/g, (chr) ->
        cc = chr.charCodeAt(0)
        if cc >= 65 and cc <= 90
          cc = 65 + ((cc - 52) % 26)
        else if cc >= 97 and cc <= 122
          cc = 97 + ((cc - 84) % 26)
        else cc = 48 + ((cc - 43) % 10)  if cc >= 48 and cc <= 57
        String.fromCharCode cc
      )

    this

  $.fn.scrambledWriter = ->
    @each ->
      $ele = $(this)
      str = $ele.text()
      progress = 0
      replace = /[^\s]/g
      random = randomAlphaNum
      inc = 3
      $ele.text ""
      timer = setInterval(->
        $ele.text str.substring(0, progress) + str.substring(progress, str.length).replace(replace, random)
        progress += inc
        clearInterval timer  if progress >= str.length + inc
      , 100)

    this
) jQuery