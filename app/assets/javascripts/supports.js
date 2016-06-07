$(document).ready(function(){
  $("#support_category_id").on('change', function (e) {
     //alert("hola");
     //console.log($( "#support_category_id option:selected" ).text())
    $.ajax({
      url: '/supports/category/subcategories',
      type: 'GET',
    }).done(function(data) {
        alert("hello")

    });  //ajax
  });
})