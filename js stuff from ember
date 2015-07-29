function Player() {
  this.playerCards = [];
};

function Game(opponentCount) {

  this.drawPile = [];
  this.discardPile = [];
  this.startingCardsRemaining = [];
};

// new game function should create player, create opponents based on
// number chosen, run starting cards for player, then for opponents,
// then take remaining cards and push into game drawpile.

// function Computer() {
//   this.playerCards = [];
// };

Player.prototype.startingCards = function () {
  var red_numbers = ["r0", "r1", "r1", "r2", "r2", "r3", "r3", "r4", "r4", "r5", "r5", "r6", "r6", "r7", "r7", "r8", "r8", "r9", "r9"]
  var green_numbers = ["g0", "g1", "g1", "g2", "g2", "g3", "g3", "g4", "g4", "g5", "g5", "g6", "g6", "g7", "g7", "g8", "g8", "g9", "g9"]
  var blue_numbers = ["b0", "b1", "b1", "b2", "b2", "b3", "b3", "b4", "b4", "b5", "b5", "b6", "b6", "b7", "b7", "b8", "b8", "b9", "b9"]
  var yellow_numbers = ["y0", "y1", "y1", "y2", "y2", "y3", "y3", "y4", "y4", "y5", "y5", "y6", "y6", "y7", "y7", "y8", "y8", "y9", "y9"]
  var red_specials = ["rd", "rd", "rs", "rs", "rv", "rv"]
  var green_specials = ["gd", "gd", "gs", "gs", "gv", "gv"]
  var blue_specials = ["bd", "bd", "bs", "bs", "bv", "bv"]
  var yellow_specials = ["yd", "yd", "ys", "ys", "yv", "yv"]
  var wild_cards = ["wc", "wc", "wc", "wc", "wf", "wf", "wf", "wf"]
  var number_cards = red_numbers.concat(green_numbers, blue_numbers, yellow_numbers);
  var special_cards = red_specials.concat(green_specials, yellow_specials, blue_specials);

  var numberCardsCount = 5;
  while (numberCardsCount > 0) {
    var randomCard = number_cards[Math.floor(Math.random() * number_cards.length)];
    var cardIndex = number_cards.indexOf(randomCard);
    this.playerCards.push(randomCard);
    number_cards.splice(cardIndex, 1);
    numberCardsCount -= 1;
    }

  var specialCardsCount = 2;
  while (specialCardsCount > 0) {
    var randomCard = special_cards[Math.floor(Math.random() * special_cards.length)];
    var cardIndex = special_cards.indexOf(randomCard);
    this.playerCards.push(randomCard);
    special_cards.splice(cardIndex, 1);
    specialCardsCount -= 1;
    }

};




$(document).ready(function() {
  $('form#start_game').submit(function(event) {
    event.preventDefault();
    var player = new Player();
    player.startingCards();
    var opponentCount = $('#opponents option:selected').val();

    $('.pre-game').slideUp('slow');
    $('#in-game').delay(1000).fadeIn();
    $('.title-header').text("The Game Has Begun!");
    // below is a test to display a card on the page(result on html 33)
    $('.test-details').append(", " + player.playerCards[0]);
  });
});
