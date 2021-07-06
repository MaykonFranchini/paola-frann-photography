class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :reviews
  validates :date, presence: true
end
