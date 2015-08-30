class CardsController < ApplicationController
  # when a card is played from a player's hand
  def update
    #set variables
    player_card = Card.find(params[:id])
    player = Player.find(player_card.player_id)
    opponent = Player.find(player_card.player_id + 1)
    game = Game.find(player.game_id)
    current_draw = Card.where(player_id: -2).first

    #discard current draw pile card
    current_draw.discard_draw

    #set player card to be the new draw pile card
    player_card.place_draw

    #perform special card actions
    if player_card.card_action != nil
      if player_card.card_action === "skip" || player_card.card_action === "reverse"
        flash[:notice] = "Opponent was skipped! " + player_card.color + " " + player_card.card_action + " was played."
      elsif player_card.card_action === "draw"
        draw_two = Card.where(player_id: 0).sample(2)
        draw_two.each do |card|
          card.player_id = opponent.id
          card.save
        end
        flash[:notice] = "Opponent was skipped! " + player_card.color + " " + player_card.card_action + " was played."
      end
      redirect_to game_path(game)
    else
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

  def show
    @card = Card.find(params[:id])
    @player_cards = Card.where(player_id: @card.player_id)
    @player = Player.find(@card.player_id)
    @game = Game.find(@player.game_id)
  end

  def color
    color = params[:format]
    card = Card.find(params[:id])
    player = Player.find(card.player_id)
    game = Game.find(player.game_id)
    opponent = Player.find(card.player_id + 1)
    current_draw = Card.where(player_id: -2).first

    current_draw.discard_draw
    card.color = color
    card.save
    card.place_draw

    if card.card_action === "draw_four"
      draw_four = Card.where(player_id: 0).sample(4)
      draw_four.each do |card|
        card.player_id = opponent.id
        card.save
      end
      redirect_to game_path(game)
    else
      opponent.opponent_turn
      redirect_to game_path(game)
    end
  end
end
