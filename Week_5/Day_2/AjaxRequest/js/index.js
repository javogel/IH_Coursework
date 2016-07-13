function onSubmit (event) {
  event.preventDefault();
  console.debug('SUBMITTED');
	var newCharacter = {
  name: $('.name').val(),
  occupation: $('.occupation').val(),
  weapon: $('.weapon').val()
  }

  // Send a post request with the data for the new character

var request = $.post('https://ironhack-characters.herokuapp.com/characters', newCharacter);

  function onSaveSuccess (response) {
    console.debug('BOOM', response);
  }

  function onSaveFailure (err) {
    console.error(err.responseJSON);
  }

  request.done(onSaveSuccess);
  request.fail(onSaveFailure);
}

$('.js-submit').on('click', onSubmit);


function fetchCharacters () {
  var request = $.get('https://ironhack-characters.herokuapp.com/characters');

  function handleCharacters (characters) {

    characters.forEach(function(char){
      var MainList = $('ul.js-character-list');
      var list = $('<li>');
      list.text(char.name + " is a " + char.occupation + " with a weapon of " + char.weapon);
      list.appendTo(MainList);
    });

    // what is the response from the get request?
    // write a function to process the response
    // it should loop through each character in the response
    // create the DOM element with HTML to describe each character
    // append to the list $('.js-character-list')
  }

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }

  request.done(handleCharacters);
  request.fail(handleError);
}

$('.js-characters').on('click', fetchCharacters);
