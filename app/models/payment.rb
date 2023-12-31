class Payment < ApplicationRecord
  belongs_to :user
  has_many :category_payments
  has_many :categories, through: :category_payments

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0.0 }
end
