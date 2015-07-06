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
  var nua = navigator.userAgent;
  var is_android = ((nua.indexOf('Mozilla/5.0') > -1 &&
    nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1) &&
    !(nua.indexOf('Chrome') > -1));
  if(isAndroid) {
    $('#marketAndroid').attr('href', 'market://details?id=com.cervezaya.cervezaya');
  }

}

$(document).on('ready', onDocumentReady);
