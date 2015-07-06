//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap

// Functions
var AppStoreFeedback = function(){
  $('.content-header-link').addClass('hide');
  $('.content-feedback').removeClass('hide');
}

function onDocumentReady() {
  $('.content-app-store').on('click',function(){
    AppStoreFeedback();
  });

  // $('#marketAndroid'). market://details?
  var ua = navigator.userAgent.toLowerCase();
  var isAndroid = ua.indexOf("android") > -1;
  if(isAndroid) {
    $('#marketAndroid').attr('href', 'market://details?id=com.cervezaya.cervezaya');
  }

}

$(document).on('ready', onDocumentReady);
