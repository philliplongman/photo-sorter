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

  // $("#photo").click(function(e){
  //   var $target = $(e.target);
  //   var maxHeight = $target.css("max-height");
  //   var maxWidth = $target.css("max-width");
  //
  //   if (maxHeight != "none" && maxWidth != "none") {
  //     $target.css({ "max-width": "none", "max-height": "none" });
  //   } else {
  //     var windowHeight = $(window).height();
  //     $target.css({ "max-width": "100%", "max-height": windowHeight });
  //   }
  // });


  var photo = document.getElementById("photo");
  var photoHeight = photo.naturalHeight;
  var photoWidth = photo.naturalWidth;
  var $container = $(".photo-container");
  var containerHeight = $container.height();
  var containerWidth = $container.width();

  var $slider = $(".slider")
  var options = {
    "data-start":         containerWidth,
    "data-end":           photoWidth,
    "data-initial-start": containerWidth
  }
  if (photoHeight < containerHeight && photoWidth < containerWidth) {
    options["data-disabled"] = true
  }
  var slider = new Foundation.Slider($slider, options);


  $(".slider").on("moved.zf.slider", function(){
    var newWidth = $(".slider input").val();
    $("#photo").width(newWidth)
  });

});
