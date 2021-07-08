class Book < ApplicationRecord
    monetize :price_cents
    has_many :orders, dependent: :destroy
    validates :name, :description, :delivery_estimate, presence: true 
end
