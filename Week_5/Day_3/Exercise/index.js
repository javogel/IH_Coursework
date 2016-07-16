
$(document).ready(function(){




var output = $('#where-am-i')

if ("geolocation" in navigator) {
 $('#where-am-i').on('click', getLocation);
} else {
  alert("Geolocation is not available")
}

function getLocation() {
  console.log('Getting location...');
  navigator.geolocation.getCurrentPosition(onLocation, onError);
};

// var options = {
//   enableHighAccuracy: true
// };

function onLocation (position) {

  var latitude  = position.coords.latitude;
  var longitude = position.coords.longitude;

$('#location').text("Your latitude is " + latitude +
"and your longitude is" + longitude)



output.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';

var img = new Image();
img.src = "https://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

output.appendChild(img);

}
});

function onError(error) {
  console.log("Getting location failed: " + error.code);
}

function displayMap(lat, lon) {
  // your code here
}
