$(document).ready(function(){
  $("#support_category_id").on('change', function (e) {
     //console.log($( "#support_category_id option:selected" ).text())
     var sub = $("#support_category_id option:selected" ).text();
    $.ajax({
      url: '/supports/'+ sub +'/subcategories',
      type: 'GET',
    }).done(function(data) {
        //select ?? option?
    });  //ajax
  });
})