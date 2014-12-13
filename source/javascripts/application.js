/* Application JS: */

//= require "jquery-1.10.2"
//= require "waypoints"

  var jQuery = jQuery.noConflict();
  jQuery(function() {

    // jQuery('.module').waypoint(function() {
    //   var kids = jQuery(this).find('.fade');
    //   kids.toggleClass('in');
    // }, { offset: 1 });
    jQuery('#welcome .fade').addClass('in');

    // var waypointOffset = jQuery('[data-waypoint-offset]');
    // var pullTrigger = jQuery('[data-waypoint-trigger]');
    // var damnKids = jQuery('[data-waypoint-trigger]');
    // jQuery(pullTrigger).waypoint(function() {
    //   jQuery(damnKids).toggleClass('in');
    // }, { offset: waypointOffset });

  });

