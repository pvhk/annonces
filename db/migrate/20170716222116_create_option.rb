class CreateOption < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :name
      t.integer :price
      t.string :annonce_id
    end
  end
end
