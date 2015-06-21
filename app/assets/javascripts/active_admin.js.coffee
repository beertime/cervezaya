#= require active_admin/base
#= require select2
#= require jquery.geocomplete

$ ->
  select2Options =
    width: 'element'

  $('select').select2(select2Options)

  $(document).on 'has_many_add:after', ->
    $('select').select2(select2Options)

  $('#bar_address').geocomplete().bind 'geocode:result', (event, result)->
    console.log result
    $('#bar_country').select2 'val', result.address_components[4].short_name
    $('#bar_region').val result.address_components[2].long_name
    $('#bar_latitude').val result.geometry.location.lat()
    $('#bar_longitude').val result.geometry.location.lng()
