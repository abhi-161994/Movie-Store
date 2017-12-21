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
//= require rails-ujs
//= require jquery
//= require rails_emoji_picker
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// jQuery(function() {
//     //----- OPEN
// jQuery(document).ready(function(e){
//         var targeted_popup_class = jQuery('[data-popup-open]').attr('data-popup-open');
//         jQuery('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
//
//         e.preventDefault();
//     });
//
//     //----- CLOSE
//   jQuery('[data-popup-close]').on('click', function(e)  {
//         var targeted_popup_class = jQuery(this).attr('data-popup-close');
//         jQuery('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
//
//         e.preventDefault();
//     });
// });


jQuery(document).ready(function(){
  var pathname = window.location.pathname;

  var res = pathname.split("/");
   var totalRowCount = $("table.table tr").length;


//jQuery( "table.table tr:nth-child("+res[2]+") td a" ).addClass("visited");
/*  for(var i=1;i<= totalRowCount;i++)
  {
      if(i==res[2])
      {
      jQuery()
      }
  }*/
});

/*jQuery( document ).ajaxComplete(function() {

  var pathname = window.location.pathname;

  var res = pathname.split("/");
   var totalRowCount = $("table.table tr").length;


jQuery( "table.table tr:nth-child("+res[2]+") td a" ).addClass("visited");
});
*/
