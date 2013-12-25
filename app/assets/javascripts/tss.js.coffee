$ ->
  $('div.navi_container').on "click", "a.suite_link", ->
    $(this).parent().find('div.scripts').slideToggle(300)
  $(document).on "ajax:success", ->
    $("div#tabs").tabs()
$ ->
  $("div.scripts").on "ajax:success", ->
    $('div#summary_func').hide()
    $('div.steps_container').unbind("click")
    $('div.steps_container').on "click", '#show_summary_func', ->
      $(this).nextAll('div#summary_func').slideToggle(300)
  
$ ->
  $('div#step').hide()
$ ->
  $('#show_step').on "click", ->
    $('div#step').slideToggle(300)	
