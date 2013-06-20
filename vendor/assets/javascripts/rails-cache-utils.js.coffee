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
  user_id = getCookie('user_id')
  if user_id
    $('head').append('<style> .hidden-signed-in { display: none; }</style>')
  else
    $('head').append('<style> .hidden-signed-out { display: none; }</style>')

  $('.hidden-user').each ->
    $(this).hide() if $(this).data('user-id').toString() == user_id

  $('.visible-user').each ->
    $(this).show() if $(this).data('user-id').toString() == user_id
