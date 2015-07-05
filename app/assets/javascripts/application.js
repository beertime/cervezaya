//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap

// Functions
var AppStoreFeedback = function(){
  $('.content-header-link').addClass('hide');
  $('.content-feedback').removeClass('hide');
}

function onDocumentReady() {
  $('#appstore').on('click',function(){
    AppStoreFeedback();
  })
}

$(document).on('ready', onDocumentReady);
