//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap

$(document).on('ready', onDocumentReady);

function onDocumentReady() {
   $('.footer-social img').on('mouseover', function(){
     var photo = $(this).attr('hover');
     socialIconHover($(this), photo);
   })

   $('.footer-social img').on('mouseout', function(){
     var photo = $(this).attr('photo');
     socialIconHover($(this), photo);
   })
 }


//  Functions
 var socialIconHover = function(img, photo){
   $(img).attr('src', 'assets/'+photo);
 }
