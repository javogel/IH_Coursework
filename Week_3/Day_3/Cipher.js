var phrase = 'Testing Ceasars Cipher'

function cipher(phrase) {

    var split_phrase = phrase.split("");

    var mappedLetters = split_phrase.map(function(letter){

        var array = [];
        array.push(String.fromCharCode(letter.charCodeAt(0) + 3));

        return array;
      });

    encrypted = mappedLetters.join('');
    return encrypted;
};

console.log(cipher(phrase));
