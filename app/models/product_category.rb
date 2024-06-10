class ProductCategory < ApplicationRecord
  has_many :products
  VALID_IDENTIFIERS = (0..17).to_a.freeze

  validates :identifier, inclusion: { in: VALID_IDENTIFIERS, message: '%<value>s is not a valid identifier' }
end
