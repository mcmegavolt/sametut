// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.geocomplete.min
//= require bootstrap
//= require rails.validations
//= require_tree .

$(document).ready(function(){

    // Geocomplete

    curLocation = new window.google.maps.LatLng( gon.latitude, gon.longitude );
    
    $("#geocomplete").geocomplete({
        map: ".geocomplete-map",
        mapOptions: {
          scrollwheel: true,
          zoom: gon.map_zoom

        },
        location: curLocation,
        details: "form",
        detailsAttribute: "populate",
        markerOptions: {
          draggable: true,
          position: curLocation
        }
    });

    $("#geocomplete").bind("geocode:dragged", function(event, latLng){
        $("input[populate=lat]").val(latLng.lat());
        $("input[populate=lng]").val(latLng.lng());
        $("#reset").fadeIn();
    });
  
    $("#reset").click(function(){
        $("#geocomplete").geocomplete("resetMarker");
        $("#reset").fadeOut();

        return false;
    });

    // UI
    $('.datepicker').datepicker({
        changeYear: true,
        changeMonth: true,
        yearRange: "-70y:-14y"
    });

    // Add caption to image from alt text in posting
    $('.show_caption img').jcaption({
        //Element to wrap the image and caption in
        wrapperElement: 'div',
        //Class for wrapper element
        wrapperClass: 'caption',
        //Caption Element
        captionElement: 'span',
        //Attribute of image to use as caption source
        imageAttr: 'alt',
        //If true, it checks to make sure there is caption copy before running on each image
        requireText: false,
        //Should inline style be copied from img element to wrapper
        copyStyle: true,
        //Strip inline style from image
        removeStyle: false,
        //Strip align attribute from image
        removeAlign: true,
        //Assign the value of the image's align attribute as a class to the wrapper
        copyAlignmentToClass: false,
        //Assign the value of the image's float value as a class to the wrapper
        copyFloatToClass: true,
        //Assign a width to the wrapper that matches the image
        autoWidth: true,
        //Animate on hover over the image
        animate: false,
        //Show Animation
        show: {opacity: 'show'},
        showDuration: 200,
        //Hide Animation
        hide: {opacity: 'hide'},
        hideDuration: 200
    });

});


function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".control-group").fadeOut();
}

function remove_fieldset(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest("fieldset").fadeOut();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
}
