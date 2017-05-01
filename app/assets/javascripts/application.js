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
//= require jquery.raty
//= require jquery.raty.min
//= require bootstrap-sprockets
//= require toastr
//= require faye
//= require jquery.slimscroll.min
//= require private_pub
//= require_tree .


$(function(){

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
      $('#image_preview')
        .attr('src', e.target.result)
        .removeClass("hide")
      };

      reader.readAsDataURL(input.files[0]);
    }
  }


  //function initMap() {
  var map = new google.maps.Map(document.getElementById('pac-input'), {center: {lat: -33.8688, lng: 151.2195},zoom: 13});
  var input = document.getElementById('pac-input');
  var autocomplete = new google.maps.places.Autocomplete(input);
  //}

})