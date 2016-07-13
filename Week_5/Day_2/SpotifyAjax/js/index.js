var resultsList = $('.js-results');
var albumsList = $('.albums');
var trackList = $('.songs');


function fetchSongs (e) {
   e.preventDefault();
  var request_address = 'https://api.spotify.com/v1/search?type=artist&query=';
  var search_term = $('.search').val();
  var request = $.get(request_address + search_term);

  function createArtists (){
      resultsList.empty()
      var response = JSON.parse(request.responseText);
      response.artists.items.forEach(function(artist){
            var list = $('<li>');
            list.text(" " + artist.name);
            list.attr('data-toggle','modal')
            list.attr('data-target','#albums')
            list.addClass('artist-name')
            list.attr('id', artist.id)

            var image = $('<img>');
            if (artist.images[2] === undefined) {
              image.attr('src', artist.images[1].url);
            }else {
              image.attr('src', artist.images[2].url);
            }
            image.prependTo(list);
            list.appendTo(resultsList);
    });



    };

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }


  // This is one way to call the success and fail functions. The other is outlined below
  request.done(createArtists);
  request.fail(handleError);
}



$('.js-submit').on('click', fetchSongs);

// Running this inside createArtists the create so that it binds correctly

$('ul').on('click', 'li.artist-name', function (e) {
   albumsList.empty();
   var clicked = $(this)
    if (clicked.is('img')){
      var artist_id = clicked.parentNode.id;
    }else {
      var artist_id = clicked[0].id;
    }
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/artists/'+ artist_id + '/albums',
      success: function(response){
        response.items.forEach(function(album){
          var album_list = $('<li>');
          album_list.text(" " + album.name);
          album_list.attr('data-toggle','modal');
          album_list.attr('data-target','#songs');
          album_list.addClass('album-name');
          album_list.attr('id', album.id);
          album_list.appendTo(albumsList);
        });
      },
      dataType: 'json'
    });
});


$('ul').on('click', 'li.album-name', function (e) {
   trackList.empty();
   $('#albums').modal('hide');
   var clicked = $(this)
   var album_id = clicked[0].id;

    // This is the other way to make an ajax call
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/albums/'+ album_id + '/tracks',
      success: function(response){
        response.items.forEach(function(track){
          var track_list = $('<li>');
          var link = $('<a>')
          link.attr('href', track.preview_url)
          // link.attr('href', track.external_url.spotify)
          link.text(" " + track.name);
          link.appendTo(track_list)
          track_list.addClass('track-name');
          track_list.attr('id', track.id);
          track_list.appendTo(trackList);

        });
      },
      dataType: 'json'
    });
});
