class Category < ApplicationRecord
  has_many :annonces
  belongs_to :game
end
