class Annonce < ApplicationRecord
    validate :validation_method
    validates :prix,presence: true, format: {with: /([0-9])\w+/}
    
    def validation_method
        if name.length < 4
            errors.add(:name, :inferior_4, { message:'Il faut que la longeur du nom soit superieur à 4 !'})
        end
        if description.length < 10
            errors.add(:description, :inferior_10, { message:'Il faut que la longeur de la description soit superieur à 10 !'})
        end
    end
end
