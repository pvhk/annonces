class AddGameToAnnonce < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :game_id, :integer
  end
end
