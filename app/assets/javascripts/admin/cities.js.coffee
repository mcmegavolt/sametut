jQuery ->

  regions = $('select[id$=city_region_id]').html()

  $('#root_region_id').change ->
    region = $('#root_region_id :selected').text()
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(regions).filter("optgroup[label='#{escaped_region}']").html()
    if options
      $('select[id$=city_region_id]').html(options)
      $('select[id$=city_region_id]').parent().show()
    else
      $('select[id$=city_region_id]').html(regions)
      $('select[id$=city_region_id]').parent().show()