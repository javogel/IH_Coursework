

module.exports = function decoder(wordlist){

  var keywords = [];
    for (i = 0; i < wordlist.length; i++) {
      var curr_word = wordlist[i].split('');

      keywords.push(curr_word[i%5]);
  };
      return keywords;
};
