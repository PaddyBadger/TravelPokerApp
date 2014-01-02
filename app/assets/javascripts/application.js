//= require jquery
//= require jquery_ujs
//= require jquery.geocomplete.min.js
//= require jquery.tinycarousel.min.js
//= require slider.js.coffee
//= require_tree .


$=jQuery;

$(document).ready(function(){
  $(function(){$("#geocomplete").geocomplete();});

$(document).ready(function(){
  $('.categories, .tags, .category, .pokerLike').tooltip({
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
            intervaltime: 5000,
            rewind: true,
            animation: true,
            duration: 500,
            callback: null
  });

  $('#showBacks').tinycarousel({
            start: 1,
            display: 1,
            axis: "x",
            controls: true,
            pager: false,
            interval: false,
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



$(document).ready(function() {
    $('.categories img').click(function() {
      $('.categories img').removeClass('check');
    });
    $("#image_id_1").click(function() {
      $(this).addClass('check');
      $("#card_category_id_1").prop("checked", "true")
     });  
    $("#image_id_2").click(function() {
      $(this).addClass('check');
      $("#card_category_id_2").prop("checked", "true")
     });  
    $("#image_id_3").click(function() {
      $(this).addClass('check');
      $("#card_category_id_3").prop("checked", "true")
     });  
    $("#image_id_4").click(function() {
      $(this).addClass('check');
      $("#card_category_id_4").prop("checked", "true")
     });  
    $("#image_id_5").click(function() {
      $(this).addClass('check');
      $("#card_category_id_5").prop("checked", "true")
     });  
    $("#image_id_6").click(function() {
      $(this).addClass('check');
      $("#card_category_id_6").prop("checked", "true")
     }); 
    $("#image_id_7").click(function() {
      $(this).addClass('check');
      $("#card_category_id_7").prop("checked", "true")
     });  
    $("#image_id_8").click(function() {
      $(this).addClass('check');
      $("#card_category_id_8").prop("checked", "true")
     });     
    $("#image_id_9").click(function() {
      $(this).addClass('check');
      $("#card_category_id_9").prop("checked", "true")
     });     
});

$(document).ready(function() {
    $('.seasons img').click(function() {
      $('.seasons img').removeClass('checkSeason');
    });
    $("#season_image_id_1").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_1").prop("checked", "true")
     });  
    $("#season_image_id_2").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_2").prop("checked", "true")
     });  
    $("#season_image_id_3").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_3").prop("checked", "true")
     });  
    $("#season_image_id_4").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_4").prop("checked", "true")
     });  
    $("#season_image_id_5").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_5").prop("checked", "true")
     });  
    $("#season_image_id_6").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_6").prop("checked", "true")
     }); 
    $("#season_image_id_7").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_7").prop("checked", "true")
     });  
    $("#season_image_id_8").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_8").prop("checked", "true")
     });     
    $("#season_image_id_9").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_9").prop("checked", "true")
     });    
      $("#season_image_id_10").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_10").prop("checked", "true")
     });  
    $("#season_image_id_11").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_11").prop("checked", "true")
     });  
    $("#season_image_id_12").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_12").prop("checked", "true")
     });  
    $("#season_image_id_13").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_13").prop("checked", "true")
     });  
    $("#season_image_id_14").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_14").prop("checked", "true")
     });  
    $("#season_image_id_15").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_15").prop("checked", "true")
     }); 
    $("#season_image_id_16").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_16").prop("checked", "true")
     });  
    $("#season_image_id_17").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_17").prop("checked", "true")
     });     
    $("#season_image_id_18").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_18").prop("checked", "true")
     });  
    $("#season_image_id_19").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_19").prop("checked", "true")
     });     
    $("#season_image_id_20").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_20").prop("checked", "true")
     }); 
    $("#season_image_id_21").click(function() {
      $(this).addClass('checkSeason');
      $("#card_season_id_21").prop("checked", "true")
     }); 
});

$(document).ready(function() {
  $(".showEditDeck").slideUp();
  $(".editDeck").click(function() {
    $(".showEditDeck").toggle();
  });
});

