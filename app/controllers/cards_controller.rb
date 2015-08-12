class CardsController < ApplicationController
  # when a card is played from a player's hand
  def update
    #set variables
    player_card = Card.find(params[:id])
    player = Player.find(player_card.player_id)
    opponent = Player.find(player_card.player_id + 1)
    game = Game.find(player.game_id)
    current_draw = Card.where(player_id: -2)

    #discard current draw pile card
    current_draw.first.player_id = -1
    current_draw.first.save

    #set player card to be the new draw pile card
    player_card.player_id = -2
    player_card.save

    #change the current turn value
    if game.current_turn == player.id
      game.current_turn = opponent.id
      game.save
    else
      game.current_turn = player.id
      game.save
    end
    # process the opponent's turn
    opponent.opponent_turn
    redirect_to game_path(game)
  end

  # When a card is drawn from the draw pile
  def draw
    #set variables
    game = Game.find(params[:id])
    player = game.players.first.id
    opponent = game.players.last.id

    #draw a random card from the draw pile and add it to player hand.
    drawn_card = Card.where(player_id: 0).sample
    drawn_card.player_id = player
    drawn_card.save

    redirect_to game_path(game)
  end
end
