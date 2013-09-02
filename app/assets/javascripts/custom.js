$(function(){

    $("#department_school_ids").select2({
        width: 700
    });

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
    
});



$(document).ready(function(){


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