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
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap-sprockets
//= require particles
//= require turbolinks
//= require ckeditor/init
//= require select2
//= require owl.carousel
//= require toastr
//= require_tree .

(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');
 
    panel.find('.panel-body').toggle();
    panel.attr('class', 'panel panel-default');
 
    if (panel.find('.panel-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();

$(document).on('turbolinks:load',function(){
 // $('.owl-carousel').owlCarousel({
 //  loop:true,
 //    margin:10,
 //    responsiveClass:true,
 //    responsive:{
 //        0:{
 //            items:1,
 //            nav:true,
 //            loop:true
 //        },
 //        500:{
 //            items:1,
 //            nav:true,
 //            loop:true
 //        },
 //        700:{
 //            items:1,
 //            nav:true,
 //            loop:true
 //        },
 //        1000:{
 //            items:1,
 //            nav:true,
 //            loop:true
 //        }
 //    }
 //  });
 $('.owl-carousel').owlCarousel({
    center: true,
    items:1,
    loop:true,
    margin:10,
    responsive:{
        600:{
            items:1
        }
    }
});
$('.nonloop').owlCarousel({
    center: true,
    items:2,
    loop:false,
    margin:10,
    responsive:{
        600:{
            items:4
        }
    }
});
});


$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
});

$(document).on('turbolinks:load',function(){
  $( ".select2" ).select2();
  $(".myTable").DataTable();
})

jQuery(function() {
  return $("[data-behavior='delete']").on("click", function(e) {
    e.preventDefault();
    return swal({
      title: 'Are you sure?',
      text: 'You will not be able to recover this record!',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel please!',
      closeOnConfirm: false,
      closeOnCancel: false
    }, (function(_this) {
      return function(confirmed) {
        if (confirmed) {
          $.ajax({
            url: $(_this).attr("href"),
            dataType: "JSON",
            method: "DELETE",
            success: function() {
              return location.reload();
            }
          });
        } else {
          swal('Cancelled', 'Record is safe :)', 'error');
        }
      };
    })(this));
  });
});

$(document).on('turbolinks:load',function(){
    $('ul.nav li.dropdown').hover(function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
  }, function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
  });
    var myNavBar = {
      flagAdd: true,
      elements: [],
      init: function (elements) {
          this.elements = elements;
      },
      add : function() {
          if(this.flagAdd) {
              for(var i=0; i < this.elements.length; i++) {
                  document.getElementById(this.elements[i]).className += " fixed-theme";
              }
              this.flagAdd = false;
          }
      },
      remove: function() {
          for(var i=0; i < this.elements.length; i++) {
              document.getElementById(this.elements[i]).className =
                      document.getElementById(this.elements[i]).className.replace( /(?:^|\s)fixed-theme(?!\S)/g , '' );
          }
          this.flagAdd = true;
      }
  };
  myNavBar.init(  [
      "header",
      "header-container",
      "brand"
  ]);
  function offSetManager(){
      var yOffset = 0;
      var currYOffSet = window.pageYOffset;
      if(yOffset < currYOffSet) {
          myNavBar.add();
      }
      else if(currYOffSet == yOffset){
          myNavBar.remove();
      }
  }
  window.onscroll = function(e) {
      offSetManager();
  }
  offSetManager();
  });
  
   // handle go to top button
    var handleGo2Top = function () {       
        var Go2TopOperation = function(){
            var CurrentWindowPosition = $(window).scrollTop();// current vertical position
            if (CurrentWindowPosition > 300) {
                $(".go2top").show();
            } else {
                $(".go2top").hide();
            }
        };

        Go2TopOperation();// call headerFix() when the page was loaded
        if (navigator.userAgent.match(/iPhone|iPad|iPod/i)) {
            $(window).bind("touchend touchcancel touchleave", function(e){
                Go2TopOperation();
            });
        } else {
            $(window).scroll(function() {
                Go2TopOperation();
            });
        }

        $(".go2top").click(function(e) {
            e.preventDefault();
             $("html, body").animate({ scrollTop: 0 }, 600);
        });
    }