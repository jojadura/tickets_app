# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#support_subcategory_id').parent().hide()
  subcategories = $('#support_category_id').html()
  $('#support_category_id').change ->
    category = $('#support_category_id :selected').text()
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(subcategories).filter("optgroup[label='#{escaped_category}']").html()
    if options
      $('#support_subcategory_id').html(options)
      $('#support_subcategory_id').parent().show()
    else
      $('#support_subcategory_id').empty()
      $('#support_subcategory_id').parent().hide()