var words, sentence;
var decoder = require("./decoder.js");
pry = require('pryjs')


function super_decoder(sent, instruction){
  var words_to_decode = []
  var split_message = sent.split(' ');
  var params = instruction.split('-')
  var start = 0;
  var add = 0;

  if(params[0] === "even"){
    start = 1;
    add = 2;
  } else if(params[0] === "odd"){
    start = 0;
    add = 2;

  } else if(params[0] === "every"){
    start = 0;
    add = 1;
  }

  if(params[1] === "backward"){
    var message_reversed = split_message.reverse();
  } else if(params[1] === "forward"){
    var message_reversed = split_message;
  }



  for (var i = start; i < message_reversed.length; i = i+add) {
      words_to_decode.push(message_reversed[i]);
  };

  var message = decoder(words_to_decode);
  return message;
};




var sentence1 = "Attack her nose under here with an itch"

var sentence2 = "Raul Nuñez call never finished"

var sentence3 = "Start rapping this or countless queasy wizards give back jay-z"

var sentence4 = "inner peace is overrated"

var sentence5 = "Fill the proper tank for the cow"


finalMessage1 = super_decoder(sentence1, 'every-backward');
console.log(finalMessage1.join(""));

finalMessage2 = super_decoder(sentence2, 'every-forward');
console.log(finalMessage2.join(""));

finalMessage3 = super_decoder(sentence3, 'every-backward');
console.log(finalMessage3.join(""));

finalMessage4 = super_decoder(sentence4, 'odd-forward');
console.log(finalMessage4.join(""));

finalMessage5 = super_decoder(sentence5, 'odd-backward');
console.log(finalMessage5.join(""));
