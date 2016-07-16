var map;
var positions_counter=0

$(document).ready(function(){


  if ("geolocation" in navigator){
    navigator.geolocation.getCurrentPosition(onLocation, onError);
  }

  loadStorage();

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
    zoom: 17
  });
    createMarker(position);
}

function createMarker(position) {
  var marker = new google.maps.Marker({
   position: position,
   map: map
 });


 console.log("createMarker invoked with this location");
 console.log(position);
}

function setupAutocomplete(){
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if (place.geometry.location) {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
      console.log(place.geometry.location)
      createMarker(place.geometry.location)
      savePositionInStorage(place.geometry.location)

    } else {
      alert("The place has no location...?")
    }
  });
}


function savePositionInStorage(position){
  var stringifiedPosition = JSON.stringify(position);

  window.localStorage.setItem(positions_counter, stringifiedPosition);
  positions_counter++;
}

function loadStorage(){
  var position_count = window.localStorage.length;

  for(i=0; i<position_count; i++){

    var current_position = window.localStorage.getItem(i);

    position_object = JSON.parse(current_position);
    console.log("lat")
    console.log(position_object["lat"])
    console.log("lng")
    console.log(position_object["lng"])

    position_to_load = {
      lat: position_object["lat"],
      lng: position_object["lng"]
    };
      createMarker(position_to_load);

  };
};
