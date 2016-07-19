var PokemonController = function () {
  this.setListeners()
};
​
PokemonController.prototype.fetchPokemon = function (e) {
  var clickedEl = $(e.currentTarget);
  var url = clickedEl.data('pokemon-uri');
  $.ajax({
    url: url,
    success: this.render,
    error: function () {
      console.log('in da error');
    }
  })
}
​
PokemonController.prototype.render = function (pokemonData) {
  $('.js-pokemon-name').text(pokemonData.name);
  $('.js-pokemon-id').text('#' + pokemonData.national_id);
  $('.js-pokemon-height').text(pokemonData.height);
  $('.js-pokemon-weight').text(pokemonData.weight);
  $('.modal').modal('show');
}
​
PokemonController.prototype.setListeners = function () {
  $('.js-show-pokemon').on('click', this.fetchPokemon.bind(this))
}
