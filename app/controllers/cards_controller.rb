class CardsController < ApplicationController
  def update
    player_card = Card.find(params[:id])
    current_draw = Card.where(player_id: -2)
    current_draw.first.player_id = -1
    current_draw.first.save
    player_card.player_id = -2
    player_card.save
    redirect_to :back
  end
end
