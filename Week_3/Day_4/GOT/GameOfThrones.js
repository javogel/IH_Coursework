var fs = require('fs');

function fileActions(err, file){
    if (err) {
        throw err;
    }
    var eps = JSON.parse(file);

    function filter_func(value) {
      return value.rating > 8.5;
      }
     episodes = eps.filter(filter_func);


    var episodes = episodes.sort(function(a, b){
      return a.episode_number - b.episode_number;
    });

  for (x=0; x<episodes.length ; x++){
    var starrating = ""
    for(i=episodes[x].rating; i>0; i-- ) {
      starrating = starrating + "*";
    };

      console.log("Title: " + episodes[x].title + " Episode #: " + episodes[x].episode_number +
      "\n"+ episodes[x].description + "\n" + "Rating: " +episodes[x].rating + " " + starrating + "\n\n");

    };



  function searchFor(query, callback){
    var search_episodes = []

    for (v=0; v<eps.length ; v++){
      if (eps[v].description.indexOf(query) != -1){
        search_episodes.push(eps[v].title);
      }
    }
    callback(search_episodes)
  };

  searchFor("Jon", function(y){console.log(y)});

};


fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);
