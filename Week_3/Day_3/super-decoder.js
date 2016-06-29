var words, sentence;
var decoder = require("./decoder.js");


var sentence = "fill the proper tank for the cow"

function super_decoder(sent, instruction){
  var words_to_decode = []
  var split_message = sent.split(' ');
  var params = instruction.split('-')
  var start = 0;
  var add = 0;

  if(params[0] === "even"){
    start = 0;
    add = 2;
  } else if(params[0] === "odd"){
    start = 1;
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




// message should be "dynamite"
// message = decoder(words);
// message2 = decoder(words2);
// console.log(message);
// console.log(message2);

finalMessage = super_decoder(sentence, 'even-backward');
console.log(finalMessage.join(""));
