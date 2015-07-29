class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.column :card_type, :string
      t.column :color, :string
      t.column :number, :integer
      t.column :card_action, :string
      t.column :player_id, :integer
      t.column :game_id, :integer
    end
  end
end
