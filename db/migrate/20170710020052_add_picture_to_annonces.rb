class AddPictureToAnnonces < ActiveRecord::Migration[5.1]
  def change
    add_column :annonces, :picture, :boolean
  end
end
