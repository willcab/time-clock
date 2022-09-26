class Store < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true, length: { minimum: 10 }

    has_many :employee
    
end
