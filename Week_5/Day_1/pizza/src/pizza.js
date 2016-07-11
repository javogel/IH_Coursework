// Write your Pizza Builder JavaScript in this file.
var price = 13;
$( document ).ready(function() {
  // Handler for .ready() called.
  $( '.price li:nth-child(4)').toggle();
  $( '.price li:nth-child(5)').toggle();
  $('strong').text(price);
});


$('.btn-pepperonni').on('click', function(){
  $('.pep').toggle();
  $('.btn-pepperonni').toggleClass('active');
  $( '.price li:first-child').toggle();

  if ($( ".btn-pepperonni" ).hasClass( "active" )) {
    price = price + 1;

  }else{
    price = price - 1;
  }
  $('strong').text(price);

})


$('.btn-mushrooms').on('click', function(){
  $('.mushroom').toggle();
  $('.btn-mushrooms').toggleClass('active');
  $( '.price li:nth-child(2)').toggle();

  if ($( ".btn-mushrooms" ).hasClass( "active" )) {
    price = price + 1;

  }else{
    price = price - 1;
  }
  $('strong').text(price);


})


$('.btn-green-peppers').on('click', function(){
  $('.green-pepper').toggle();
  $('.btn-green-peppers').toggleClass('active');
  $( '.price li:nth-child(3)').toggle();


  if ($( ".btn-green-peppers" ).hasClass( "active" )) {
    price = price + 1;

  }else{
    price = price - 1;
  }
  $('strong').text(price);
})




$('.btn-sauce').on('click', function(){
  $('.sauce').toggleClass('sauce-white');
  $('.btn-sauce').toggleClass('active');
  $( '.price li:nth-child(4)').toggle();

  if ($( ".btn-sauce" ).hasClass( "active" )) {
    price = price + 3;

  }else{
    price = price - 3;
  }
  $('strong').text(price);
})

$('.btn-crust').on('click', function(){
  $('.crust').toggleClass('crust-gluten-free');
  $('.btn-crust').toggleClass('active');
  $( '.price li:nth-child(5)').toggle();


  if ($( ".btn-crust" ).hasClass( "active" )) {
    price = price + 5;

  }else{
    price = price - 5;
  }
  $('strong').text(price);
})
