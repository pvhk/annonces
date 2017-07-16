class AddCategoryIdToAnnonce < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :category_id, :integer
  end
end
