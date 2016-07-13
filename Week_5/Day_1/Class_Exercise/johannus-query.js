

//
// setInterval(function(){
//   var cell = $('.cell');
//   cell.toggleClass('green')
// }, 2000)




// $('.cell').hover(function(){
//
// });




$( document ).ready(function() {


  $('div.cell').hover(function(){
    $(this).css("background-color", "red");
  }, function(){
    $(this).css("background-color", "blue");
  });




});



$(document).on('keypress', function(e){
  console.log('you pressed a key');
  console.log(e.which);
})
