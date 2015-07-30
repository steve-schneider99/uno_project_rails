class CardsController < ApplicationController
  def update
    player_card = Card.find(params[:id])
    player = Player.find(player_card.player_id)
    opponent = Player.find(player_card.player_id + 1)
    game = Game.find(player.game_id)
    current_draw = Card.where(player_id: -2)

    current_draw.first.player_id = -1
    current_draw.first.save

    player_card.player_id = -2
    player_card.save

    redirect_to game_path(game)
  end

  def draw
    game = Game.find(params[:id])
    player = game.players.first.id
    drawn_card = Card.where(player_id: 0).sample
    drawn_card.player_id = player
    drawn_card.save
    redirect_to game_path(game)
  end
end
