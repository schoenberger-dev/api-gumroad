class Artist < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[name username],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_many :products
  has_many :order_products, through: :products
  has_many :tips

  def total_tips
    tips.sum(amount_cents)
  end
end
