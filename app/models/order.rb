class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :reviews
  validates :booking_date, presence: true
end
