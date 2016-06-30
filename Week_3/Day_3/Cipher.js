var phrase = "Et tu, brute?"


function cipherBuilder(shift){

  return function(phrase) {

      var split_phrase = phrase.split("");

      shift = shift || - 3

      var mappedLetters = split_phrase.map(function(letter){
          var array = [];
          if(letter >= "A" && letter <= "Z"){
                var newnum = letter.charCodeAt(0) + shift
                if(newnum > 90){
                  newnum = newnum-26;
                }else if (newnum < 65) {
                  newnum = 90 - newnum;
                };
                array.push(String.fromCharCode(newnum));

          } else if(letter >= "a" && letter <= "z"){
                var newnum = letter.charCodeAt(0) + shift
                if(newnum > 122){
                  newnum = newnum-26;
                }else if (newnum < 97) {
                  newnum = 122 - newnum;
                };
                array.push(String.fromCharCode(newnum));
          }else {
            array.push(letter);
          };
          return array;
        });

      var encrypted = mappedLetters.join('');
      return encrypted;
  };
}

var caesarCipher6 = cipherBuilder(6)


console.log(caesarCipher6(phrase));
