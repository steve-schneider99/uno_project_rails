class Game < ActiveRecord::Base
  has_many :players

  def reset_cards
    player_cards = Card.where(player_id: self.players.first.id)
    opponent_cards = Card.where(player_id: self.players.last.id)
    draw_pile_card = Card.where(player_id: -2)
    discard_pile = Card.where(player_id: -1)

    draw_pile_card.each do |card|
      card.player_id = 0
      card.save
    end
    player_cards.each do |card|
      card.player_id = 0
      card.save
    end
    opponent_cards.each do |card|
      card.player_id = 0
      card.save
    end
    discard_pile.each do |card|
      card.player_id = 0
      card.save
    end
  end

  def set_draw_pile
    draw_card = Card.where(player_id: 0).sample
    draw_card.player_id = -2
    draw_card_color = draw_card.color ||= "Wild"
    draw_card_type = draw_card.number.to_s ||= draw_card.card_action
    self.draw_pile_card = draw_card_color + " " + draw_card_type
    draw_card.save
  end


end
