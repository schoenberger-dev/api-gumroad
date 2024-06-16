class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :artist, through: :product
end
