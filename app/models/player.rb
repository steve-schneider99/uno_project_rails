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

end
