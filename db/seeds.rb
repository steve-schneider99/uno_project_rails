# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

red_numbers = ["r0", "r1", "r1", "r2", "r2", "r3", "r3", "r4", "r4", "r5", "r5", "r6", "r6", "r7", "r7", "r8", "r8", "r9", "r9"]
green_numbers = ["g0", "g1", "g1", "g2", "g2", "g3", "g3", "g4", "g4", "g5", "g5", "g6", "g6", "g7", "g7", "g8", "g8", "g9", "g9"]
blue_numbers = ["b0", "b1", "b1", "b2", "b2", "b3", "b3", "b4", "b4", "b5", "b5", "b6", "b6", "b7", "b7", "b8", "b8", "b9", "b9"]
yellow_numbers = ["y0", "y1", "y1", "y2", "y2", "y3", "y3", "y4", "y4", "y5", "y5", "y6", "y6", "y7", "y7", "y8", "y8", "y9", "y9"]
red_specials = ["rd", "rd", "rs", "rs", "rv", "rv"]
green_specials = ["gd", "gd", "gs", "gs", "gv", "gv"]
blue_specials = ["bd", "bd", "bs", "bs", "bv", "bv"]
yellow_specials = ["yd", "yd", "ys", "ys", "yv", "yv"]
wild_cards = ["wc", "wc", "wc", "wc", "wf", "wf", "wf", "wf"]

red_numbers.each do |card|
  Card.create(card_type: "number", color: "red", number: card.last.to_i, player_id: 0)
end

blue_numbers.each do |card|
  Card.create(card_type: "number", color: "blue", number: card.last.to_i, player_id: 0)
end

green_numbers.each do |card|
  Card.create(card_type: "number", color: "green", number: card.last.to_i, player_id: 0)
end

yellow_numbers.each do |card|
  Card.create(card_type: "number", color: "yellow", number: card.last.to_i, player_id: 0)
end

red_specials.each do |card|
  if card.last == "d"
    Card.create(card_type: "special", color: "red", card_action: "draw", player_id: 0)
  elsif card.last == "s"
    Card.create(card_type: "special", color: "red", card_action: "skip", player_id: 0)
  else
    Card.create(card_type: "special", color: "red", card_action: "reverse", player_id: 0)
  end
end

blue_specials.each do |card|
  if card.last == "d"
    Card.create(card_type: "special", color: "blue", card_action: "draw", player_id: 0)
  elsif card.last == "s"
    Card.create(card_type: "special", color: "blue", card_action: "skip", player_id: 0)
  else
    Card.create(card_type: "special", color: "blue", card_action: "reverse", player_id: 0)
  end
end

green_specials.each do |card|
  if card.last == "d"
    Card.create(card_type: "special", color: "green", card_action: "draw", player_id: 0)
  elsif card.last == "s"
    Card.create(card_type: "special", color: "green", card_action: "skip", player_id: 0)
  else
    Card.create(card_type: "special", color: "green", card_action: "reverse", player_id: 0)
  end
end

yellow_specials.each do |card|
  if card.last == "d"
    Card.create(card_type: "special", color: "yellow", card_action: "draw", player_id: 0)
  elsif card.last == "s"
    Card.create(card_type: "special", color: "yellow", card_action: "skip", player_id: 0)
  else
    Card.create(card_type: "special", color: "yellow", card_action: "reverse", player_id: 0)
  end
end

wild_cards.each do |card|
  if card == "wc"
    Card.create(card_type: "wild", card_action: "wild_color", player_id: 0)
  else
    Card.create(card_type: "wild", card_action: "draw_four", player_id: 0 )
  end
end



# number_cards = red_numbers.concat(green_numbers, blue_numbers, yellow_numbers)
# special_cards = red_specials.concat(green_specials, yellow_specials, blue_specials)
