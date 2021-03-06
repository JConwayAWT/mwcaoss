// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function(){

  var nLocationImages = $(".location-image").length;
  var currentImageIndex = 0;
  var nextImageIndex = 1;

  setInterval(function(){
    currentImage = $( $(".location-image")[currentImageIndex] );
    nextImage = $( $(".location-image")[nextImageIndex] );

    currentImage.fadeTo(1500, 0);
    nextImage.fadeTo(1500, 1);

    currentImageIndex = (currentImageIndex + 1) % nLocationImages;
    nextImageIndex = (currentImageIndex + 1) % nLocationImages;

  }, 6000);

  $("#submit-application-button").click(function(){
    $(this).hide();
    $(".application-submitted").show();
  });

  $("#contactUsModal").on('shown.bs.modal', function(e){
    $("#contact_request_name").focus();
  });

  $("#contact-us-submit").click(function(){
    var contact_form = $("#contact-us-form").find("form").serialize()

    $("#contact-us-submit").toggle();
    $("#contact-us-cancel").toggle();
    $("#contact-us-loading-indicator").toggle();

    $.ajax({
      url: '/contact_requests',
      type: 'POST',
      dataType: 'JSON',
      data: contact_form
    })
    .done(function(data) {
      $("#contact-us-submit").toggle();
      $("#contact-us-cancel").toggle();
      $("#contact-us-loading-indicator").toggle();

      $("#contactUsModal").modal("hide");
      $("#contactSuccessModal").modal("show");
    })
    .fail(function(data) {
      $("#contact-us-submit").toggle();
      $("#contact-us-cancel").toggle();
      $("#contact-us-loading-indicator").toggle();

      $("#contactUsModal").modal("hide");
      $("#contactErrorModal").modal("show");
    });
    
  });

});