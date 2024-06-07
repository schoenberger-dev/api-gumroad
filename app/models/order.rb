class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  validates :amount, presence: true
  validates :tip, numericality: { greater_than_or_equal_to: 0 }

  def total_amount
    amount + tip
  end
end
