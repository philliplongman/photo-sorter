// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });


$(function(){

  $('input[type="checkbox"]:checked').parents(".button").toggleClass("hollow")

  $("div.input.button label").click(function(e){
    $(e.target).parent("div").toggleClass("hollow");
  });

  function bigPhoto (){
    var photo = document.getElementById("photo");
    var photoHeight = photo.naturalHeight;
    var photoWidth = photo.naturalWidth;

    var $container = $(".photo-container");
    var containerHeight = $container.height();
    var containerWidth = $container.width();

    if (photoHeight > containerHeight || photoWidth > containerWidth) {
      return true;
    } else {
      return false;
    }
  };

  function photoConstrained (){
    var css = $("#photo").css(["max-width", "max-height"]);

    if (css["max-height"] != "none" && css["max-width"] != "none") {
      return true;
    } else {
      return false;
    }
  };


  $(".photo-container").click(function(e){
    var $photo = $(e.target);
    var $container = $photo.parent();

    if ( bigPhoto() && photoConstrained() ) {
      $photo.css({ "max-width": "none", "max-height": "none" });
      $container.css({ "display": "block" })
    } else {
      var windowHeight = $(window).height();
      $photo.css({ "max-width": "100%", "max-height": windowHeight });
      $container.css({
        "display": "flex",
        "justify-content": "center",
        "align-items": "center"
      })
    }
  });

});
