class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    player_name = params[:game].first.at(1)
    @game = Game.create(game_params)
    player = @game.players.create(player_name: player_name).assign_cards
    opponent = @game.players.create(player_name: "opponent").assign_cards
    @game.current_turn = @game.players.first.id
    @game.set_draw_pile
    @game.draw_pile_remaining = Card.where(player_id: 0).length
    @game.save
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
    @current_turn = Player.find(@game.current_turn)
    @players = @game.players
    @player_cards = Card.where(player_id: @game.players.first.id)
    @opponent_cards = Card.where(player_id: @game.players.last.id)
    @draw_pile = Card.where(player_id: 0)
    @draw_card = Card.where(player_id: -2)
    @discard_pile = Card.where(player_id: -1)
  end

  def reset
    @game = Game.find(params[:id])
    @game.reset_cards
    redirect_to games_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.reset_cards
    @game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:player_name, :current_turn, :draw_pile_remaining, :draw_pile_card)
  end

end
