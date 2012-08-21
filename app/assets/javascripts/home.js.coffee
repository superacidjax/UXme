$(document).ready ->
  $("li#about").click ->
    $("#about-section").fadeIn 1000
    $("#headline-section").fadeOut(100)
    $("#projects-section").fadeOut(100)
    $("#process-section").slideUp()
    $("#simple").scrambledWriter()

$(document).ready ->
  $("li#projects").click ->
    $("#projects-section").slideDown 100
    $("#headline-section").slideUp()
    $("#about-section").slideUp()
    $("#process-section").slideUp()

$(document).ready ->
  $("li#process").click ->
    $("#process-section").fadeIn 800
    $("#headline-section").hide()
    $("#about-section").hide()
    $("#projects-section").hide()

$(document).ready ->
  $("#logo").click ->
    $("#process-section").fadeIn 800
    $("#headline-section").hide()
    $("#about-section").hide()
    $("#projects-section").hide()
$(document).ready ->
  visited = $.cookie("visited")
  unless visited?
    $("#typing").typewriter()
    $("h4#byline").hide().delay(17500).fadeIn()
    $("h5#parens").hide().delay(18500).fadeIn()
    $("h1#icebergs").hide().delay(20000).fadeIn()
    $.cookie "visited", "yes",
      expires: 7
  if visited?
    $("#typing").fadeIn(200)
    $("h4#byline").fadeIn(200)
    $("h5#parens").fadeIn(13000)
    $("h1#icebergs").fadeIn(200)


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

  $.fn.typewriter = ->
    @each ->
      $ele = $(this)
      str = $ele.text()
      progress = 0
      $ele.text ""
      timer = setInterval(->
        $ele.text str.substring(0, progress++) + ((if progress & 1 then "_" else ""))
        clearInterval timer  if progress >= str.length
      , 50)

    this

  $.fn.unscramble = ->
    @each ->
      $ele = $(this)
      str = $ele.text()
      replace = /[^\s]/
      state = []
      choose = []
      reveal = 25
      random = randomAlphaNum
      i = 0

      while i < str.length
        if str[i].match(replace)
          state.push random()
          choose.push i
        else
          state.push str[i]
        i++
      shuffle choose
      $ele.text state.join("")
      timer = setInterval(->
        i = undefined
        r = reveal
        while r-- and choose.length
          i = choose.pop()
          state[i] = str[i]
        i = 0
        while i < choose.length
          state[choose[i]] = random()
          i++
        $ele.text state.join("")
        clearInterval timer  if choose.length is 0
      , 100)

    this
) jQuery