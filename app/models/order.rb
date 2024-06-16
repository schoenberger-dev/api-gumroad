class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  has_many :tips

  validates :amount_cents, presence: true
end
