class ProductCategory < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[name slug],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_many :products
  VALID_IDENTIFIERS = (0..17).to_a.freeze

  validates :identifier, inclusion: { in: VALID_IDENTIFIERS, message: '%<value>s is not a valid identifier' }
end
