// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage

//= require_tree .

$(window).on('load',function(){
  // $("#js-loader").fadeOut();

  // codepen用
  function loaderClose(){
    $("#js-loader").fadeOut();
  }
  setTimeout(loaderClose, 1000);

});

$(window).keydown(function (e1) {
  console.log(e1);
  if (e1.keyCode == 89) {
    // 89 = y
    $(window).keydown(function (e2) {
    console.log(e2);
    if (e2.keyCode == 69) {
      // 69 = e
      $(window).keydown(function (e3) {
      console.log(e3);
      if (e3.keyCode == 83) {
        // 83 = s
        $('#nomimasu').click(function(){
          $('#admin-link').show();
      })}
    })}
  })}
});

$(window).keydown(function (e4){
  if(e4.keyCode == 81) {
    // 81 = q
    $('#admin-link').hide();
  }
});