// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require Chart.bundle
//= require chartkick
//= require bootstrap-datepicker

ready= function(){ 
  $("#search").keyup(function(){
     $("#supports_search").submit();
     
  }); 
// esta funcion se declara aquí, para que funcione la primera 
//ves el click modal en close.  
$(".boton_modal").click(function(){
  $('#ajax-modal').modal('show');   
});
  
 
};

$(document).ready(ready);
$(document).on('page:load', ready);

$(function () {


  setInterval(function() {
     $("#supports_search").submit();
    console.log("ejecute ")
   }, 100 * 1000);
});