var map;
var positions_counter=0
var zoom = 2

$(document).ready(function(){


  if ("geolocation" in navigator){
    navigator.geolocation.getCurrentPosition(onLocation, onError);

    setTimeout(loadStorage, 4000);

  }



});




function onLocation(position){
  // We can't just directly feed the position into our google map
  // The objects are formatted differently, google maps is looking for
  // an object with "lat" and "lng" keys.
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };


  createMap(myPosition);
  setupAutocomplete();
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

function createMap(position){
  map = new google.maps.Map($('#map')[0], {
    center: position,
    zoom: zoom
  });



    createMarker(position);
}

function createMarker(position) {



  var marker = new google.maps.Marker({
   position: position,
   map: map
 });



 // console.log("createMarker invoked with this location");
 // console.log(position);
}

function setupAutocomplete(){
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if (place.geometry.location) {
      map.setCenter(place.geometry.location);
      map.setZoom(zoom);
      console.log(place.geometry.location)
      createMarker(place.geometry.location)
      addInfoToMarker(place.geometry.location, place.formatted_address)
      savePositionInStorage(place.geometry.location, place.formatted_address)

    } else {
      alert("The place has no location...?")
    }
  });
}


function savePositionInStorage(position, address){
  var positionWithAddress = {
    coord: position,
    content: address
  };
  var stringifiedPosition = JSON.stringify(positionWithAddress);

  window.localStorage.setItem(positions_counter, stringifiedPosition);
  positions_counter++;
};

function loadStorage(){
  var position_count = window.localStorage.length;

  for(i=0; i<position_count; i++){

    var current_position = window.localStorage.getItem(i);

    position_object = JSON.parse(current_position);
    // console.log("lat")
    // console.log(position_object["lat"])
    // console.log("lng")
    // console.log(position_object["lng"])

    // var toClass = {}.toString
    // alert(toClass.call(position_object.lat))
    // alert(toClass.call(parseInt(position_object.lat)))

    var position_to_load = {
      lat: parseInt(position_object.coord.lat),
      lng: parseInt(position_object.coord.lng)
    };
      createMarker(position_to_load);
      addInfoToMarker(position_to_load, position_object.content)


  };
};

function addInfoToMarker(location, content){

  var contentString = '<div id="content">'+
            '<div id="address">'+
            content
            '</div>'+
            '</div>';

  var infowindow = new google.maps.InfoWindow({
          content: contentString
    });

  var marker = new google.maps.Marker({
          position: location,
          map: map,
          title: "Welcome to"
        });

  marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
}
