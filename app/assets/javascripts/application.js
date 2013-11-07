//= require jquery
//= require jquery_ujs
//= require jquery.geocomplete.min.js
//= require_tree .


$=jQuery;

$(document).ready(function(){
  $(function(){$("#geocomplete").geocomplete();});

$(document).ready(function(){
  $('.categories, .tags, .category').tooltip({
    position: {
      my: "right center",
      at: "right bottom",
    }
  });
});

  $('#slider-code').tinycarousel({
            start: 1,
            display: 1,
            axis: "x",
            controls: false,
            pager: false,
            interval: true,
            intervaltime: 10000,
            rewind: true,
            animation: true,
            duration: 500,
            callback: null
  });

  jQuery(function(){

    $('.trip,.deck').hover(function(){
      $(this).children('.tripMeta').toggle();
    });
  });
});

$(document).ready(function() {
  $('.keepOptions, .shareOptions').hide();
   $('.keep').click(function() {
      $('.keepOptions').show();
    });
   $('.share').click(function() {
      $('.shareOptions').show();
    });
   $('.keepOptions, .shareOptions').mouseleave(function() {
    $(this).hide();
   });
  });

  $(document).ready(function() {
  $('.twistCardAll').hide();  
    
    $('.trip').on('click', function() {
      var card = $(this).closest('.card'); 
      $(card).children('.twistCardAll').show("slide", 500);
      $(card).find('.location').geocomplete({map: $(card).find('.map'), location: $(card).find('.location').text()});
    });
    $('.twistCardBack').on('click', function() {
        var card = $(this).closest('.card'); 
        $(card).children('.twistCardAll').hide("slide", 500);
        $('.keepOptions, .shareOptions').hide();
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

document.addEventListener('keydown', function (event) {
  var esc = event.which == 27,
      nl = event.which == 13,
      el = event.target,
      input = el.nodeName != 'INPUT' && el.nodeName != 'TEXTAREA',
      data = {};

  if (input) {
    if (esc) {
      // restore state
      document.execCommand('undo');
      el.blur();
    } else if (nl) {
      // save
      data[el.getAttribute('editable')] = el.innerHTML;

      $.ajax({
        url: window.location.toString(),
        data: data,
        type: 'post'
      });
    
      log(JSON.stringify(data));

      el.blur();
      event.preventDefault();
    }
  }
}, true);





