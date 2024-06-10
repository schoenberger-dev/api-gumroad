class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :product_category
  belongs_to :artist
end
