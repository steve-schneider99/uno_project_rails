class Card < ActiveRecord::Base

  def discard_draw
    self.player_id = -1
    self.save
  end

  def place_draw
    self.player_id = -2
    self.save
  end

end
