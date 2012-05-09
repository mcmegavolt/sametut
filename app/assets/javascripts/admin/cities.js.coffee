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


  sub_regions = $('select[id$=sub_region_id]').html()

  $('[id$=sub_region_id]').change ->
    sub_region = $('#location_sub_region_id :selected').text()
    escaped_sub_region = sub_region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    sub_options = $(sub_regions).filter("optgroup[label='#{escaped_sub_region}']").html()
    if sub_options
      $('select[id$=location_attributes_city_id]').html(sub_options)
      $('select[id$=location_attributes_city_id]').parent().show()
    else
      $('select[id$=location_attributes_city_id]').html(sub_regions)
      $('select[id$=location_attributes_city_id]').parent().show()