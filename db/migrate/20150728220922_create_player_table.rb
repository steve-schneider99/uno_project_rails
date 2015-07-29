class CreatePlayerTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.column :player_name, :string
      t.column :player_cards, :string
      t.column :game_id, :integer
    end
  end
end
