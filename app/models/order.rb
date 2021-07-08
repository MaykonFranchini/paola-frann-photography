class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  belongs_to :book
  validates :booking_date, presence: true
end
