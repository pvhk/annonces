class AddNameToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :name, :string
    add_column :options, :price, :integer
    add_column :options, :annonce_id, :integer
  end
end
