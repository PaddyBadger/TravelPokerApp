//= require jquery
//= require_tree .

$=jQuery;

$(document).ready(function(){
jQuery(function(){

  $('.pokerHover,.trip,.deck').hover(function(){
    $(this).children('.tripMeta,.pokerHover').fadeIn(500);
  },
  function(){
  $('.dk_container.span3.dk_shown.dk_theme_default').removeClass('dk_open');
    $(this).children('.tripMeta,.pokerHover').fadeOut(500);
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