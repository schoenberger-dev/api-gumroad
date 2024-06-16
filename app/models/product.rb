class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[name description],
                  associated_against: {
                    product_category: %i[name slug],
                    artist: %i[name username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :product_category
  belongs_to :artist
  has_many :order_products
  has_many :orders, through: :order_products

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
