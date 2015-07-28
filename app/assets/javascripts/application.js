//= require jquery2
//= require jquery_ujs
//= require bootstrap

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
  var isMobile = screen.width <= 960;
  var isAndroid = /android/i.test(navigator.userAgent.toLowerCase());
  if (isMobile && isAndroid) {
    window.open('market://details?id=com.cervezaya.cervezaya');
  } else if (isAndroid) {
    $('#marketAndroid').attr('href', 'market://details?id=com.cervezaya.cervezaya');
  }

}

$(document).on('ready', onDocumentReady);
