var phrases = [
  "A dog is worth a million amoeba.",
  "Happiest is he who pees quietly in the bush.",
  "The baby that doesn't cry does not get the TIT.",
  "He who thinks he knows is full of shit.",
  "The world is an oyster. Smelly and yet, it still has its beauty."];

var List = $('ul.phrase-list');
var num_reg = /\d+/;
var key_duplicator = $('<li>');
key_duplicator.addClass('key_dup');


  var createList = function(){

    List.empty();
    var bold_phrase = $('<strong>');
      $.each(phrases, function(i)
      {
        var item = $('<li>');
        var remove_img = $('<img>');
        remove_img.addClass('remove');

        if (phrases[i] == $('.phrase').text()){
          bold_phrase.text(phrases[i]);
          bold_phrase.appendTo(item);
          item.appendTo(List);
        }else{
          item.text(phrases[i]).appendTo(List);
        }
        item.addClass('list'+i);
        remove_img.attr('src', 'http://twitterstand.umiacs.umd.edu/images/red-x.png');

        item.append(remove_img);
      });


      List.append(key_duplicator);

  }

    var changePhrase = function(){
    var phrase = phrases[Math.round(Math.random()*(phrases.length-1))];
    $('.phrase').text(phrase);
    createList();
  }


  // Write your Pizza Builder JavaScript in this file.
  $( document ).ready(function() {
    changePhrase();
    $('.hide-list').toggle()
      createList();
      List.toggle()
  });


  $('.phrase-change').on('click', function() {
    changePhrase();
  });



  $('.new-phrase').keypress(function (e) {

    if (e.which == 13) {
      phrases.push($('.new-phrase').val());
      $('.phrase').text(phrases.slice(-1)[0]);
      $('.new-phrase').val('')
      createList();
    }


  });


  // $('.new-phrase').click(function(){
  //   var key_dup = $('<li>');
  //   key_dup.addClass('key_dup');
  //   List.append(key_dup);
  //
  // });



$('.new-phrase').keyup(function() {
    $('.key_dup').text( this.value );
});


  $('.show-list').on('click', function(){
      List.toggle()
      $('.show-list').toggle()
      $('.hide-list').toggle()
  })

  $('.hide-list').on('click', function(){
      List.toggle()
      $('.hide-list').toggle()
      $('.show-list').toggle()
  })




  $('body').on('click', '.remove', function () {
    var target_parent = $(this).parent();
    var className = target_parent.attr('class');
    var classNum = className.match(num_reg);

    phrases.splice(parseInt(classNum[0]), 1);

    createList();
  });
