class CreateOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.numeric :quantity, default: 1, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
