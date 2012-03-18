jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('.carousel').carousel('pause')
  $('.tabs a:active').tab('show')
