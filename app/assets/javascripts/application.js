//= require jquery
//= require jquery_ujs
//= require_tree .

$=jQuery;

$(document).ready(function(){
jQuery(function(){

  $('.trip,.deck').hover(function(){
    $(this).children('.tripMeta').fadeIn(500);
  },
  function(){
  $('.dk_container.span3.dk_shown.dk_theme_default').removeClass('dk_open');
    $(this).children('.tripMeta').fadeOut(500);
});
});
});

$(document).ready(function() {
  
  // Expand Panel
  $("#open").click(function(){
    $("div#panel").slideDown("slow");
  
  }); 
  
  // Collapse Panel
  $("#close").click(function(){
    $("div#panel").slideUp("slow"); 
  });   
  
  // Switch buttons from "Log In | Register" to "Close Panel" on click
  $("#toggle a").click(function () {
    $("#toggle a").toggle();
  });       
});

  // User Panel Tabs
  $(document).ready(function() {
   $('.userLike, .userInfo').hide();
   $('.userCards').fadeIn();
   $('#userCards').addClass('focus');
  
  $('#userCards').click(function() {  
    $('.userLike, .userInfo, .userCards').hide();
    $('#userCards, #userLike, #userInfo').removeClass('focus');
    $('#userCards').addClass('focus');
    $('.userCards').show();
  });

 $('#userLike').click(function() {
   $('.userLike, .userInfo, .userCards').hide();
   $('#userCards, #userLike, #userInfo').removeClass('focus');
   $('#userLike').addClass('focus');
   $('.userLike').show();
 });

 $('#userInfo').click(function() {
   $('.userCards, .userInfo, .userLike').hide();
   $('#userCards, #userLike, #userInfo').removeClass('focus');
    $('#userInfo').addClass('focus');
   $('.userInfo').show();
 });
});

