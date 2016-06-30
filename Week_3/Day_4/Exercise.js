// var Car = function(model, noise) {
//   this.model = model;
//   this.noise = noise;
//   this.wheels = 4;
//
// };
//
//
// Car.prototype.makeNois = function(){
//   console.log(noise);
// }

// //
// sleep(10, function(){
// console.log("Its been 10 seconds");
// });
//
// function sleep(time, callback){
// setTimeout(callback, time*1000);
// }


blastOff(10);

function blastOff(time){
  var counter = time


  if(counter!=0){
  countBlastOff(counter, function(){
    console.log(counter);
    blastOff(counter-1);

  });



  }

}


function countBlastOff(counter, callback){

  setTimeout(callback, 1000);

}
