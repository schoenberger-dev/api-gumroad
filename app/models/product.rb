class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :product_category
  belongs_to :artist

  def price
    price_cents.to_f / 100
  end

  def price=(amount)
    self.price_cents = (amount.to_f * 100)
  end

  def as_json(options = {})
    super(options).merge(price:)
  end

  def round_down(value)
    (value * 10).floor / 10.0
  end
end
