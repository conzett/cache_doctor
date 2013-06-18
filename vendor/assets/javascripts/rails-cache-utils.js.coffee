getCookie = (name) ->
  nameEQ = name + "="
  ca = document.cookie.split(";")
  i = 0

  while i < ca.length
    c = ca[i]
    c = c.substring(1, c.length)  while c.charAt(0) is " "
    return c.substring(nameEQ.length, c.length)  if c.indexOf(nameEQ) is 0
    i++
  null

do ->
  if getCookie('user_id')
    $('head').append('<style> .hidden-signed-in { display: none; }</style>')
  else
    $('head').append('<style> .hidden-signed-out { display: none; }</style>')
