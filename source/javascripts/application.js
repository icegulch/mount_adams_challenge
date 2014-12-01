/* Application JS: */

//= require "jquery-1.10.2"
//= require "jquery.fullPage"
//= require "jquery.easings.min"
//= require "jquery.slimscroll.min"

    var jQuery = jQuery.noConflict();
    jQuery(function() {

      if( jQuery(window).width() > 768) {

        // enable full page scrolling & animations
        jQuery('#fullpage').fullpage({
          resize: false,
          anchors: ['welcome', 'challenge', 'reward', 'point', 'route', 'rules', 'results', 'sponsors'],
          scrollingSpeed: 900,
          'afterLoad': function (anchorLink, index) {
            jQuery('.section.active').addClass('in');
          },
          onLeave: function(index, nextIndex, direction, anchorLink){
            jQuery('.section:not(.active)').removeClass('in');
          }

        });

      }

    });


