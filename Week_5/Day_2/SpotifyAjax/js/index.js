// var resultsList = $('.js-results');
// var albumsList = $('.albums');
// var trackList = $('.songs');


var SpotifyController = function(){
  // activates on click listeners which calls ajax handlers

  this.resultsList = '.js-results';
  this.albumsList = '.albums';
  this.tracksList = '.songs';

};

SpotifyController.prototype.setListeners = function(){

  $('.js-submit').on('click', this.fetchArtists.bind(this));
  // on click handler for artist name clicks
  $('ul').on('click', 'li.artist-name', this.fetchAlbums.bind(this));

  $('ul').on('click', 'li.album-name', this.fetchSongs.bind(this));
};


// Initiats ajax request
SpotifyController.prototype.fetchArtists = function(event) {
   event.preventDefault();
  var request_address = 'https://api.spotify.com/v1/search?type=artist&query=';
  var search_term = $('.search').val();


  $.ajax({
    type: 'GET',
    url: request_address + search_term,
    success: this.createArtists.bind(this),
    dataType: 'json'
  });

};


// Function that searches for artists given search term

SpotifyController.prototype.createArtists = function(response){

      $(this.resultsList).empty()

      response.artists.items.forEach(function(artist){
            var list = $('<li>');
            list.text(" " + artist.name);
            list.attr('data-toggle','modal')
            list.attr('data-target','#albums')
            list.addClass('artist-name')
            list.attr('id', artist.id)

            var image = $('<img>');
            if (artist.images[2] == undefined) {
              image.attr('src', artist.images[1].url);
            }else {
              image.attr('src', artist.images[2].url);
            }

            image.prependTo(list);
            list.appendTo(this.resultsList);
    }.bind(this));


};


SpotifyController.prototype.fetchAlbums = function (event) {
   var clicked = event.target

    if ($(clicked).is('img')){
      var artist_id = clicked.parentNode.id;
    }else {
      var artist_id = clicked.id;
    }
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/artists/'+ artist_id + '/albums',
      success: this.createAlbums.bind(this),
      dataType: 'json'
    });
}


SpotifyController.prototype.createAlbums = function(response){
  $(this.albumsList).empty();
  response.items.forEach(function(album){
    var album_list = $('<li>');
    album_list.text(" " + album.name);
    album_list.attr('data-toggle','modal');
    album_list.attr('data-target','#songs');
    album_list.addClass('album-name');
    album_list.attr('id', album.id);

    // Try to define these variables in the main controller
    album_list.appendTo(this.albumsList);

  }.bind(this));
}


SpotifyController.prototype.fetchSongs = function (e) {
   $(this.tracksList).empty();
   $('#albums').modal('hide');
   var clicked = event.target
   var album_id = clicked.id;

    // This is the other way to make an ajax call
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/albums/'+ album_id + '/tracks',
      success: this.createSongs.bind(this),
      dataType: 'json'
    });
};


SpotifyController.prototype.createSongs = function(response){
  response.items.forEach(function(track){
    var track_list = $('<li>');
    var link = $('<a>')
    link.attr('href', track.preview_url)
    // link.attr('href', track.external_url.spotify)
    link.text(" " + track.name);
    link.appendTo(track_list)
    track_list.addClass('track-name');
    track_list.attr('id', track.id);
    track_list.appendTo(this.tracksList);

  }.bind(this));
}

$(document).ready(function(){
  var spotapp = new SpotifyController();
  spotapp.setListeners();
})
