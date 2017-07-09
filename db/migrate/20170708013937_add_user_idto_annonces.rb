class AddUserIdtoAnnonces < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :user_id, :integer
  end
end
