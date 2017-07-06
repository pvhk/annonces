class UsersGrafikart < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :confirmed, :boolean
    add_column :users, :confirmation_token, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :avatar, :boolean
  end
end
