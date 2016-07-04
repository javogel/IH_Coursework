pry = require('pryjs')

var Viking = function(name, strength) {
  this.name = name;
  this.strength = strength;
  this.health = 10;

};

var Saxon = function() {
  this.name = "Random Saxon";
  this.strength = Math.floor((Math.random() * 3) + 1);
  this.health = Math.floor((Math.random() * 10) + 1);

};

var hit = function(){
  return console.log(this.name + ": Auuuuuuga");
};
var get_hit = function(opponent_stength){
  this.health = this.health - opponent_stength;
  return console.log(this.name + " Ouch! --- >" + "Health for this human is: " +  this.health + "\n")
};

var war_cry = function(){
  return console.log(this.name + ": Waaaaaar!!!!!!!!!")
};


Viking.prototype.Hit = hit;
Viking.prototype.GetHit = get_hit;
Viking.prototype.WarCry = war_cry;

Saxon.prototype.Hit = hit;
Saxon.prototype.GetHit = get_hit;

var saxons = [
  new Saxon(),
  new Saxon(),
  new Saxon()
];

var vikings = [
  new Viking("Thor", 4),
  new Viking("Valentine", 5),
  new Viking("Stephen", 4)
];

var viking1 = new Viking("James", 4);
var viking2 = new Viking("Peter", 3);
var maxturns = 5

  // eval(pry.it);

var PitFight = function(max ,player1, player2, cb){
  var counter = 2
  while(((player1.health>2) && (player2.health>2))||(counter< max)){
      if(counter%2 ==1){
        player1.Hit();
        player2.GetHit(player1.strength);

      }else{
        player2.Hit();
        player1.GetHit(player2.strength);
      }
      counter++;
  }
  cb(player1, player2);
}

var TwoFight = function(player1, player2){
        player1.Hit();
        player2.GetHit(player1.strength);
        player2.Hit();
        player1.GetHit(player2.strength);
}

var Fight = function(vteam, steam){

  this.turns = 5 + Math.floor((Math.random() * 3)+1);

  vteam.forEach(holler);
  function holler(vik){
    vik.WarCry();
  }

  var dead_saxons = 0;
  var dead_vikings = 0;
  for(i=0; i<= this.turns; i++){
    if (dead_saxons == steam.length){
      console.log("This battle is over! All Saxons are Dead.")

      break;
    }else{
      vteam.forEach(vikingturns);
    }
  }

  function vikingturns(viking){
    viking_to_fight = viking;
    saxon_to_fight = steam[Math.floor((Math.random() * steam.length))];
    if(viking_to_fight.health>0 && saxon_to_fight.health>0){
      new TwoFight(viking_to_fight, saxon_to_fight)
    } else if (viking_to_fight.health<0){
      console.log("This Viking is dead. No battle");
      dead_vikings++;
    }else if (saxon_to_fight.health<0){
      console.log("This Saxon is dead. No battle");
      dead_saxons++;
    };
  };

}


new Fight(vikings, saxons)

// new PitFight(maxturns, viking1, viking2, function(x,y){
//   console.log("The result of this pitfight is:")
//   console.log(x.name + " with health of " + x.health + " remaining. and")
//   console.log(y.name + " with health of " + x.health)
// });
