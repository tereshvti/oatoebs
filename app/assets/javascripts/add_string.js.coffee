$(document).ready ->
  $(".add_string").on "click", ->
    table = $(this).nextAll("table").first()
    trlast = table.find("tbody tr:last")
    tr = trlast.clone()
    tr.find("td").each (key, value) ->
      if value.getElementsByTagName("input").length > 0
        input = value.getElementsByTagName("input")[0]
        name = input.getAttribute('name')
        regExp = /\[\d\]/g
        match = regExp.exec(name)
        i = parseInt(match[0][1]) + 1
        name = name.replace(regExp, '[' + i + ']')
        input.setAttribute('name', name)
    trlast.after(tr)
    return false
  $('table').on "click", ".del_string", ->
    tr = $(this).parent().parent()
    if tr.parent().children().length > 2
       tr.remove()
    else
       tr.find("input").each (key, value) ->
         value.value = ''
    return false
