class User < ApplicationRecord
  has_many :payments
  has_many :categories

  validates :name, presence: true
end
