class Review < ApplicationRecord
  belongs_to :order
  validates :title, :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { greater_than: 0 } 
  validates :rating, numericality: { less_than_or_equal_to: 5 } 
end
