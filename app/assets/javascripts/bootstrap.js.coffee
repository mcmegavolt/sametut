jQuery ->
  $("a[rel=popover]").popover()
  $("#popover").popover()
  $("a[rel='tooltip']").tooltip()
  $(".collapse").collapse toggle: true
  $("#register-dialog").modal
    keyboard: true
    show: false

  $(".tooltip").tooltip()