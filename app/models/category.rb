class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, through: :category_payments
  has_many :category_payments, dependent: :destroy

  validates :name, presence: true
end
