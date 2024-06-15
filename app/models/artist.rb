class Artist < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[name username],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_many :products
end
