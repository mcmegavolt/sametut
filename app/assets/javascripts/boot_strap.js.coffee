jQuery ->
  $("a[rel=popover]").popover()
  $("#popover").popover()
  $("a[rel='tooltip']").tooltip()
  $("#register-dialog").modal
    keyboard: true
    show: false
  $(".tooltip").tooltip()