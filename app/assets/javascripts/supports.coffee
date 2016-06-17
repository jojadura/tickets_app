# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	subcategories= $('#support_sub_categories_id').html()
	$('#support_category_id').change ->
		categoria = $('#support_category_id :selected').text()
		opciones = $(subcategories).filter("optgroup[label='#{categoria}']").html()
		if opciones
			$('#support_sub_categories_id').html(opciones)
		else
			$('#support_sub_categories_id').empty()

$(document).ready(ready)
$(document).on('page:load', ready)