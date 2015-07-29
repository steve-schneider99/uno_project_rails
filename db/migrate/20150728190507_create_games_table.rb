class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.column :current_turn, :string
      t.column :draw_pile_remaining, :string
      t.column :draw_pile_card, :string
      t.column :player_name, :string
    end
  end
end
