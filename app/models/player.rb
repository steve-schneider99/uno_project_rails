class Player < ActiveRecord::Base
  belongs_to :game

  def assign_cards
    number_cards = Card.where(player_id: 0, card_type: "number").sample(5)
    number_cards.each do |card|
      card.player_id = self.id
      card.save
    end
    special_cards = Card.where(player_id: 0, card_type: "special").sample(2)
    special_cards.each do |card|
      card.player_id = self.id
      card.save
    end
  end

  #logic for computer opponent turn
  def opponent_turn
    #set variables
    game = Game.find(self.game_id)
    player = Player.find(game.players.last)
    draw_card = Card.where(player_id: -2).first
    opponent_cards = Card.where(player_id: self.id)
    possible_plays = []
    colors = ["blue", "green", "red", "yellow"]

    #determine eligible cards in hand.
    opponent_cards.each do |card|
      if card.color == draw_card.color || card.number == draw_card.number || (card.card_action != nil && card.card_action == draw_card.card_action)
        possible_plays.push(card)
      end
    end
    #starts decision logic for card to play, otherwise draws a card and looks for possible plays
    if possible_plays.any?
      #discard current draw pile card
      draw_card.player_id = -1
      draw_card.save

      #determines card to be played, sets card to be the new draw pile card
      selected_card = possible_plays.sample
      selected_card.player_id = -2
      selected_card.save

      #determines if card has special action, and executes action if it does.
      if selected_card.card_action != nil

        if selected_card.card_action === "skip" || selected_card.card_action === "reverse"
          self.opponent_turn
        elsif selected_card.card_action === "draw"
          draw_two = Card.where(player_id: 0).sample(2)
          draw_two.each do |card|
            card.player_id = game.players.first.id
            card.save
          end
          self.opponent_turn
        elsif selected_card.card_action === "draw_four"
          draw_four = Card.where(player_id: 0).sample(4)
          draw_four.each do |card|
            card.player_id = player.id
            card.save
          end
          self.opponent_turn
        elsif selected_card.card_action === "wild_color"
          selected_card.color = colors.sample
          selected_card.save
        end

      else
        #switches current turn once card has been selected and played
        if game.current_turn = self.id
          game.current_turn = player.id
          game.save
        else
          game.current_turn = self.id
          game.save
        end

      end

    else
      #draws a card from the draw pile and repeats opponent_turn process.
      drawn_card = Card.where(player_id: 0).sample
      drawn_card.player_id = self.id
      drawn_card.save
      self.opponent_turn
    end
  end

end
