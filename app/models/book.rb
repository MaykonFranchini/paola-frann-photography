class Book < ApplicationRecord
    has_many :orders
    validates :name, :description, :price, :delivery_estimate, presence: true 
end
